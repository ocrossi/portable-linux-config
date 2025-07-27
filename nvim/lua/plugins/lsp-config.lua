return {
    {
        --- plugin manager 
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        --- links between mason & lsp conf
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "ts_ls", "gopls", "clangd" }
            })
        end
    },
    {
        --- lsp servers keymaps & configs
        --- see https://github.com/neovim/nvim-lspconfig/tree/master/lsp
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities
            })
            lspconfig.pyright.setup({
                capabilities = capabilities
            })
            lspconfig.gopls.setup({
                capabilities = capabilities
            })
            lspconfig.clangd.setup({
                capabilities = capabilities
            })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', '<C-k.', vim.lsp.buf.signature_help, {})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<space>ca', vim.lsp.buf.code_action, {})
        end
    },
}
