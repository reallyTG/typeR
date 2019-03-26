library(ggm)


### Name: pcor.test
### Title: Test for zero partial association
### Aliases: pcor.test
### Keywords: htest multivariate

### ** Examples

## Are 2,3 independent given 1?
data(marks)
pcor.test(pcor(c(2,3,1), var(marks)), 1, n=88)



