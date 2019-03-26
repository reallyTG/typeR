library(logisticRR)


### Name: multinRR
### Title: Inference on relative risk under multinomial logistic regression
### Aliases: multinRR

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
result <- multinRR(multiY ~ W + X, basecov = 0, comparecov = 1,
data = dat, boot = TRUE)
print(apply(result$boot.rr, 2, sd)) # estimated standard errors using Delta method
print(sqrt(result$delta.var)) # estimated standard errors using bootstrap






