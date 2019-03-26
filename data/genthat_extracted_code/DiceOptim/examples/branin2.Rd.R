library(DiceOptim)


### Name: branin2
### Title: 2D test function
### Aliases: branin2
### Keywords: internal optimize

### ** Examples

design <- matrix(runif(200), 200, 2)
response <- apply(design, 1, branin2)



