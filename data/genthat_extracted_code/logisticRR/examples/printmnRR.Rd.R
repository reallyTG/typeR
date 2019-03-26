library(logisticRR)


### Name: printmnRR
### Title: Print adjusted relative risk using multinomial logistic
###   regression under nominal exposure variable.
### Aliases: printmnRR

### ** Examples

n <- 500
set.seed(1234)
X <- rbinom(n, 1, 0.3)
W <- rbinom(n, 1, 0.3)
W[sample(1:n, n/3)] = 2
Y <- rbinom(n, 1, plogis(X - W))
multiY <- ifelse(X == 1 , rbinom(n, 1, 0.7) + Y, rbinom(n, 1, 0.2) + Y)
print(table(multiY))
dat <- as.data.frame(cbind(multiY, X, W))
dat$W <- as.factor(dat$W)
result <- printmnRR(multiY ~ W + X, basecov = 0, comparecov = 1, data = dat)






