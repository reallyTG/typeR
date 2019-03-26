library(logisticRR)


### Name: logisticRR
### Title: Calculate adjusted relative risks
### Aliases: logisticRR

### ** Examples

n <- 500
set.seed(1234)
X <- rbinom(n, 1, 0.3)
W <- rbinom(n, 1, 0.3);
W[sample(1:n, n/3)] = 2
Y <- rbinom(n, 1, plogis(X - W))
dat <- as.data.frame(cbind(Y, X, W))
result <- logisticRR(Y ~ X + W, basecov = 0, data = dat,
                    boot = TRUE, n.boot = 200)





