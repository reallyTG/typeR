library(outliers)


### Name: outlier
### Title: Find value with largest difference from the mean
### Aliases: outlier
### Keywords: htest

### ** Examples

set.seed(1234)
y=rnorm(100)
outlier(y)
outlier(y,opposite=TRUE)
dim(y) <- c(20,5)
outlier(y)
outlier(y,opposite=TRUE)



