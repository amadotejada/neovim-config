-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer
keymap.set("n", "<leader>h", "<C-w><Left>") -- move to file explorer
keymap.set("n", "<leader>l", "<C-w><Right>") -- move to editor

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>")

-- troublexx
keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",{silent = true, noremap = true})
keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})
keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true})

-- code runner
keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rt", function()
    require("betterTerm").send(require("code_runner.commands").get_filetype_command(), 1, { clean = false, interrupt = true })
end, { desc = "Excute File"})

-- betterTerm
local betterTerm = require('betterTerm')
vim.keymap.set({"n", "t"}, "<leader>t", betterTerm.open, { desc = "Open terminal"})
vim.keymap.set({"n", "t"}, "<leader>tt", betterTerm.select, { desc = "Select terminal"})
local current = 2
vim.keymap.set(
    {"n", "t"}, "<leader>tn",
    function()
        betterTerm.open(current)
        current = current + 1
    end,
    { desc = "New terminal"}
)

-- codeium
-- keymap.set("i", "<Tab>", "<Cmd>call codeium#Accept()<CR>")
-- keymap.set("i", "<M-\\>", "<Cmd>call codeium#Complete()<CR>")
-- keymap.set("i", "<M-]>", "<Cmd>call codeium#CycleCompletions(1)<CR>")
-- keymap.set("i", "<M-[>", "<Cmd>call codeium#CycleCompletions(-1)<CR>")

-- 1st party copilot
-- keymap.set('i', '<C-\\>', '<Plug>(copilot-suggest)')
-- keymap.set('i', '<C-]>', '<Cmd>call copilot#next()<CR>')
-- keymap.set('i', '<C-[>', '<Plug>(copilot-previous)')
