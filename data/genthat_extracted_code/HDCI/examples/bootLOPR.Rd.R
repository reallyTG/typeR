library(HDCI)


### Name: bootLOPR
### Title: Bootstrap Lasso OLS Partial Ridge
### Aliases: bootLOPR

### ** Examples

library("glmnet")
library("mvtnorm") 

## generate the data
set.seed(2015)
n <- 200      # number of obs
p <- 500
s <- 10
beta <- rep(0, p)
beta[1:s] <- runif(s, 1/3, 1)
x <- rmvnorm(n = n, mean = rep(0, p), method = "svd")
signal <- sqrt(mean((x %*% beta)^2))
sigma <- as.numeric(signal / sqrt(10))  # SNR=10
y <- x %*% beta + rnorm(n)

## residual bootstrap Lasso OLS + Partial Ridge
set.seed(0)
obj <- bootLOPR(x = x, y = y, B = 10)
# confidence interval
obj$interval
sum((obj$interval[1,]<=beta) & (obj$interval[2,]>=beta))

## using parallel in the bootstrap replication
#library("doParallel")
#registerDoParallel(2)
#set.seed(0)
#system.time(obj <- bootLOPR(x = x, y = y))
#system.time(obj <- bootLOPR(x = x, y = y, parallel.boot = TRUE, ncores.boot = 2))




