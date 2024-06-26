local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ import = "cal.plugins" },
	{ import = "cal.plugins.lsp" },
	{ import = "cal.plugins.ui" },
})

-- Documenting with which-key
require("which-key").register({
	["<leader>f"] = { name = "Filetree" },
	["<leader>r"] = { name = "Rename" },
	["<leader>s"] = { name = "Search" },
	["<leader>m"] = { name = "Format or Linting" },
	["<leader>t"] = { name = "Tabs" },
	["<leader>w"] = { name = "Wins" },
	["<leader>u"] = { name = "Buffers" },
})

-- Enabling commentstring
vim.g.skip_ts_context_commentstring_module = true

require("Comment").setup({
	pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

require("ts_context_commentstring").setup({
	enable_autocmd = false,
})
