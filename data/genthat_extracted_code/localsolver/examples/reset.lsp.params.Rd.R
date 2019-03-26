library(localsolver)


### Name: reset.lsp.params
### Title: Reset all ls.problem instance parameters.
### Aliases: reset.lsp.params

### ** Examples

modelText <- lsp.model.example('extdata/knapsack.txt')
lsp <- ls.problem(modelText)
lsp$params
lsp <- set.params(lsp, lsTimeLimit=60, lsSeed=7)
lsp$params
lsp <- reset.lsp.params(lsp)
lsp$params



