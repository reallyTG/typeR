library(mHG)


### Name: mHG.test
### Title: Perform Minimum-Hypergeometric test.
### Aliases: mHG.test
### Keywords: htest

### ** Examples

N <- 50
B <- 15
lambdas <- numeric(50)
lambdas[sample(N, B)] <- 1
t <- mHG.test(lambdas)
t <- mHG.test(lambdas, n_max = 20)



