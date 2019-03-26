library(mimi)


### Name: mimi.cov
### Title: mimi.cov Compute solution of mimi with covariates effects along
###   regularization path
### Aliases: mimi.cov

### ** Examples

n = 6; p = 2
x <- matrix(rnorm(6*6*2), nrow = 6*6)
param <- matrix(x%*%c(2,0), nrow=6)+matrix(rnorm(6*6), nrow=6)
y1 <- matrix(rnorm(mean = c(param[, 1:2]), n * p), nrow = n)
y2 <- matrix(rbinom(n * p, prob = c(exp(param[,3:4])/(1+exp(param[,3:4]))), size = 1), nrow = n)
y3 <- matrix(rpois(n * p, lambda = c(exp(param[,5:6]))), nrow = n)
y <- cbind(y1, y2, y3)
var.type <- c(rep("gaussian", p), rep("binary", p), rep("poisson", p))
idx_NA <- sample(1:(3 * n * p), size = round(0.1 * 3 * n * p))
y[idx_NA] <- NA
res <- mimi.cov(y, x, var.type = var.type, lambda1 = 1, lambda2 = 2, thresh=0.1)



