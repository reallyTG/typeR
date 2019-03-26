library(SPOT)


### Name: predict.dace
### Title: DACE predictor
### Aliases: predict.dace
### Keywords: internal

### ** Examples

## Create design points
x <- cbind(runif(20)*15-5,runif(20)*15)
## Compute observations at design points
y <- funSphere(x)
## Create model
fit <- buildKrigingDACE(x,y)
## Create new design
xx <- cbind(runif(20)*15-5,runif(20)*15)
## Predict candidates
y1 <- predict(fit,xx)$y
## Plot residuals
plot(y1 - funSphere(xx))




