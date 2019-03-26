library(localsolver)


### Name: ls.solve
### Title: Solves a LocalSolver problem on data passed.
### Aliases: ls.solve

### ** Examples

model.text.lsp <- lsp.model.example('extdata/knapsack.txt')
lsp <- ls.problem(model.text.lsp)
lsp <- set.params(lsp, lsTimeLimit=60)
lsp <- add.output.expr(lsp, "x", 4)
data <- list(nbItems=4L, itemWeights=c(1L,2L,3L,4L), itemValues=c(5,6,7,8), knapsackBound=40L)
result <- ls.solve(lsp, data)



