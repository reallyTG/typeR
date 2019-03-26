library(LambertW)


### Name: ks.test.t
### Title: One-sample Kolmogorov-Smirnov test for student-t distribution
### Aliases: ks.test.t
### Keywords: htest

### ** Examples

set.seed(1021)
beta.true <- c(location = 0, scale = 1, df = 4)
xx <- rt(n = 1000, df = beta.true['df'])
ks.test.t(xx)
ks.test.t(xx, beta.true)




