library(outliers)


### Name: grubbs.test
### Title: Grubbs tests for one or two outliers in data sample
### Aliases: grubbs.test
### Keywords: htest

### ** Examples


set.seed(1234)
x = rnorm(10)
grubbs.test(x)
grubbs.test(x,type=20)
grubbs.test(x,type=11)




