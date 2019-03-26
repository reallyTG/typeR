library(propagate)


### Name: statVec
### Title: Transform an input vector into one with defined mean and
###   standard deviation
### Aliases: statVec
### Keywords: matrix multivariate algebra

### ** Examples

## Create a 10-sized vector with mean = 10 and s.d. = 1.
x <- rnorm(10, 5, 2)
mean(x) ## => mean is not 5!
sd(x) ## => s.d. is not 2!

z <- statVec(x, 5, 2)
mean(z) ## => mean is 5!
sd(z) ## => s.d. is 2!



