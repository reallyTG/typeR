library(circular)


### Name: range.circular
### Title: Circular Range
### Aliases: range.circular
### Keywords: univar htest

### ** Examples

data <- rvonmises(n=50, mu=circular(0), kappa=2)
range(data, test=TRUE)
data <- circular(runif(50, 0, 2*pi))
range(data, test=TRUE)



