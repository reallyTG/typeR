library(drtmle)


### Name: predict.SL.npreg
### Title: Predict method for SL.npreg
### Aliases: predict.SL.npreg

### ** Examples

# simulate data
set.seed(1234)
n <- 100
X <- data.frame(X1 = rnorm(n))
Y <- X$X1 + rnorm(n)
# fit npreg
fit <- SL.npreg(Y = Y, X = X, newX = X)
# predict on fit
newX <- data.frame(X1 = c(-1,0,1))
pred <- predict(fit$fit, newdata = newX)



