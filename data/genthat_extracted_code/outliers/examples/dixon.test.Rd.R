library(outliers)


### Name: dixon.test
### Title: Dixon tests for outlier
### Aliases: dixon.test
### Keywords: htest

### ** Examples


set.seed(1234)
x = rnorm(10)
dixon.test(x)
dixon.test(x,opposite=TRUE)
dixon.test(x,type=10)




