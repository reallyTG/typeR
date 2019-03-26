library(localsolver)


### Name: set.params
### Title: Set ls.problem instance parameters.
### Aliases: set.params

### ** Examples

model.text.lsp <- lsp.model.example('extdata/knapsack.txt')
lsp <- ls.problem(model.text.lsp)
lsp <- set.params(lsp, lsTimeLimit=10, lsIterationLimit= 5)



