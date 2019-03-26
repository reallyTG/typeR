library(SPOT)


### Name: predict.kriging
### Title: Predict Kriging Model
### Aliases: predict.kriging
### Keywords: internal

### ** Examples

## Test-function:
braninFunction <- function (x) {	
	(x[2]  - 5.1/(4 * pi^2) * (x[1] ^2) + 5/pi * x[1]  - 6)^2 +
 10 * (1 - 1/(8 * pi)) * cos(x[1] ) + 10
}
## Create design points
x <- cbind(runif(20)*15-5,runif(20)*15)
## Compute observations at design points (for Branin function)
y <- as.matrix(apply(x,1,braninFunction))
## Create model
fit <- buildKriging(x,y)
fit$target <- c("y","s","ei")
## first estimate error with regressive predictor
predict(fit,x)




