library(logisticRR)


### Name: multiRR
### Title: Inference on relative risk under multinomial logistic regression
### Aliases: multiRR

### ** Examples

n <- 500
set.seed(1234)
X <- rbinom(n, 1, 0.3)
W <- rbinom(n, 1, 0.3)
W[sample(1:n, n/3)] = 2
Y <- rbinom(n, 1, plogis(X - W))
dat <- as.data.frame(cbind(Y, X, W))
result <- multiRR(W ~ X + Y, basecov = 0, data = dat, boot = TRUE, n.boot = 100)
print(apply(result$boot.rr, 2, sd)) # estimated standard errors using Delta method
print(sqrt(result$delta.var)) # estimated standard errors using bootstrap




