library(localsolver)


### Name: set.temp.dir
### Title: Sets folder to use for the problem instance solving process
###   temporary data.
### Aliases: set.temp.dir

### ** Examples

model.text.lsp <- lsp.model.example('extdata/knapsack.txt')
lsp <- ls.problem(model.text.lsp)
lsp <- set.temp.dir(lsp, tempdir())



