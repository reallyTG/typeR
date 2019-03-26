library(logisticRR)


### Name: printmRR
### Title: Print adjusted relative risk using multinomial logistic
###   regression under binary or ordinal exposure variable.
### Aliases: printmRR

### ** Examples

n <- 500
set.seed(1234)
X <- rbinom(n, 1, 0.3)
W <- rbinom(n, 1, 0.3)
W[sample(1:n, n/3)] = 2
Y <- rbinom(n, 1, plogis(X - W))
dat <- as.data.frame(cbind(Y, X, W))
result <- printmRR(W ~ X + Y, basecov = 0, data = dat)





