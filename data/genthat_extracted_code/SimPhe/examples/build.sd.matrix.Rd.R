library(SimPhe)


### Name: build.sd.matrix
### Title: build a matrix with standard deviation
### Aliases: build.sd.matrix

### ** Examples

x1 <- rnorm(4000, mean =  5, sd = 10)
x2 <- rnorm(4000, mean = 10, sd = 30)
x <- matrix(cbind(x1, x2), ncol = 2)
build.sd.matrix(x)



