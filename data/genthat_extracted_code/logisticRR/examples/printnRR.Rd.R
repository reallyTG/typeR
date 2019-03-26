library(logisticRR)


### Name: printnRR
### Title: Print adjusted relative risk under nominal exposure variable.
### Aliases: printnRR

### ** Examples

n <- 500
set.seed(1234)
W <- rbinom(n, 1, 0.3); W[sample(1:n, n/3)] = 2
dat <- as.data.frame(W)
dat$X <- sample( c("low", "medium", "high"), size = n, replace = TRUE)
dat$Y <- ifelse(dat$X == "low", rbinom(n, 1, plogis(W + 0.5)),
               ifelse(dat$X == "medium", rbinom(n, 1, plogis(W + 0.2)),
               rbinom(n, 1, plogis(W - 0.4)) ))
dat$X <- as.factor(dat$X)
result <- printnRR(Y ~ X + W, basecov = "high", comparecov = "low", data = dat)





