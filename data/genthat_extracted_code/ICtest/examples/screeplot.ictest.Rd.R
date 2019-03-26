library(ICtest)


### Name: screeplot.ictest
### Title: Screeplot for an ictest Object
### Aliases: screeplot.ictest
### Keywords: hplot

### ** Examples

n <- 200
X <- cbind(rnorm(n, sd = 2), rnorm(n, sd = 1.5), rnorm(n), rnorm(n), rnorm(n))

TestCov <- PCAasymp(X, k = 2)
screeplot(TestCov)



