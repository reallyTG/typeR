library(drtmle)


### Name: SL.npreg
### Title: Super learner wrapper for kernel regression
### Aliases: SL.npreg

### ** Examples

# simulate data
set.seed(1234)
n <- 100
X <- data.frame(X1 = rnorm(n))
Y <- X$X1 + rnorm(n)
# fit npreg
fit <- SL.npreg(Y = Y, X = X, newX = X)



