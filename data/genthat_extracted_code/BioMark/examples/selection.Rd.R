library(BioMark)


### Name: selection
### Title: Accessor function to the selected variables of a BioMark object
### Aliases: selection
### Keywords: models multivariate

### ** Examples

## stability-based selection
set.seed(17)
data(spikedApples)
apple.stab <- get.biom(X = spikedApples$dataMatrix,
                       Y = factor(rep(1:2, each = 10)),
                       ncomp = 2:3, type = "stab")
selected.variables <- selection(apple.stab)



