library(DiceOptim)


### Name: goldsteinprice
### Title: 2D test function
### Aliases: goldsteinprice
### Keywords: internal optimize

### ** Examples

design <- matrix(runif(200), 200, 2)
response <- apply(design, 1, goldsteinprice)



