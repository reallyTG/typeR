library(localsolver)


### Name: add.output.expr
### Title: Add expression to output of ls.problem.
### Aliases: add.output.expr

### ** Examples

model.text.lsp <- lsp.model.example('extdata/knapsack.txt')
lsp <- ls.problem(model.text.lsp)
lsp <- add.output.expr(lsp, "knapsackWeight")
# produces table x[i in 1..5][j in 1..10] in LocalSolver output
# and array with dims = c(5,10) under name x in output of ls.solve.
lsp <- add.output.expr(lsp, "x", c(5, 10))



