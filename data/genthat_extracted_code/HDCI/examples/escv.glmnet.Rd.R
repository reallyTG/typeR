library(HDCI)


### Name: escv.glmnet
### Title: escv glmnet
### Aliases: escv.glmnet

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

## escv without parallel
# using Lasso+OLS in the cv fit.
set.seed(0)
obj <- escv.glmnet(x, y, cv.OLS = TRUE) 

# using Lasso in the cv fit.
set.seed(0)
obj <- escv.glmnet(x, y)

## escv with parallel
#library("doParallel")
#library("doRNG")
#registerDoParallel(2)

# using Lasso+OLS in the cv fit.
#registerDoRNG(seed = 0)
#obj <- escv.glmnet(x, y, cv.OLS = TRUE, nfolds = 4, parallel = TRUE)

# using Lasso in the cv fit.
#registerDoRNG(seed = 0) 
#obj <- escv.glmnet(x, y, parallel = TRUE)




