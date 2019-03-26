library(DiceOptim)


### Name: rosenbrock4
### Title: 4D test function
### Aliases: rosenbrock4
### Keywords: internal optimize

### ** Examples

design <- matrix(runif(400), 100, 4)
response <- apply(design, 1, rosenbrock4)



