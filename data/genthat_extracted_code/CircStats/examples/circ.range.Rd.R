library(CircStats)


### Name: circ.range
### Title: Circular Range
### Aliases: circ.range nCk
### Keywords: univar htest

### ** Examples

data <- rvm(50, 0, 2)
circ.range(data, test=TRUE)
data <- runif(50, 0, 2*pi)
circ.range(data, test=TRUE)



