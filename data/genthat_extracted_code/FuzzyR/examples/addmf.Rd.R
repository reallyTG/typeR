library(FuzzyR)


### Name: addmf
### Title: Insert a membership function.
### Aliases: addmf

### ** Examples

fis <- newfis('tipper')
fis <- addvar(fis, 'input', 'service', c(0, 10))
fis <- addmf(fis, 'input', 1, 'poor', 'gaussmf', c(1.5, 0))



