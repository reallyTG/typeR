library(DiceOptim)


### Name: sphere6
### Title: 6D sphere function
### Aliases: sphere6
### Keywords: internal optimize

### ** Examples

design <- matrix(runif(400), 100, 4)
response <- apply(design, 1, sphere6)



