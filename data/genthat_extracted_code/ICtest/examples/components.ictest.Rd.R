library(ICtest)


### Name: components
### Title: Generic Components Extraction Function
### Aliases: components components.ictest components.ladle
### Keywords: methods

### ** Examples

n <- 200
X <- cbind(rnorm(n, sd = 2), rnorm(n, sd = 1.5), rnorm(n), rnorm(n), rnorm(n))

TestCov <- PCAasymp(X, k = 2)
head(components(TestCov))
head(components(TestCov, which = "k"))



