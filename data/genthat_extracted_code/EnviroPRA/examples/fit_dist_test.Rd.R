library(EnviroPRA)


### Name: fit_dist_test
### Title: Summary of Godness-of-fit tests
### Aliases: fit_dist_test
### Keywords: methods

### ** Examples

set.seed(123)

a <- rnorm(n=100, mean =10, sd = 1) 

fit_dist_test(a)

b<- rexp(n = 100,rate = 1)

fit_dist_test(b)



