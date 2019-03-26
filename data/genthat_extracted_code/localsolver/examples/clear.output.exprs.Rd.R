library(localsolver)


### Name: clear.output.exprs
### Title: Remove all output expressions (see: 'add.output.expr').
### Aliases: clear.output.exprs

### ** Examples

model.text.lsp <- lsp.model.example('extdata/knapsack.txt')
lsp <- ls.problem(model.text.lsp)
lsp <- add.output.expr(lsp, "knapsackWeight")
lsp <- clear.output.exprs(lsp)



