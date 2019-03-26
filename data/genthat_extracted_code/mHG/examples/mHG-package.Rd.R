library(mHG)


### Name: mHG-package
### Title: Minimum-Hypergeometric Test
### Aliases: mHG-package mHG
### Keywords: htest package

### ** Examples

N <- 50
B <- 15
lambdas <- numeric(50)
lambdas[sample(N, B)] <- 1
t <- mHG.test(lambdas)
t <- mHG.test(lambdas, n_max = 20)



