library(lgarch)


### Name: gdiff
### Title: Difference a vector or a matrix, with special treatment of zoo
###   objects
### Aliases: gdiff
### Keywords: Statistical Models Time Series Financial Econometrics

### ** Examples

##1st difference of a series:
x <- rnorm(5)
gdiff(x)

##1st difference with no padding:
gdiff(x, pad=FALSE)

##1st difference retaining the original zoo-index ordering:
gdiff(as.zoo(x))

##1st difference of a matrix:
y <- matrix(rnorm(8),4,2)
gdiff(y)

##2nd difference of the same matrix:
gdiff(y, lag=2)




