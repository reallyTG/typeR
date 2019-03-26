library(SPOT)


### Name: predictKrigingReinterpolation
### Title: Predict Kriging Model (Re-interpolating)
### Aliases: predictKrigingReinterpolation
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
fit <- buildKriging(x,y,control=list(reinterpolate=FALSE))
fit$target <- c("y","s")
## first estimate error with regressive predictor
sreg <- predict(fit,x)$s
## now estimate error with re-interpolating predictor
sreint <- predictKrigingReinterpolation(fit,x)$s
## equivalent:
fit$reinterpolate <- TRUE
sreint2 <- predict(fit,x)$s
print(sreg)
print(sreint)
print(sreint2)
## sreint should be close to zero, significantly smaller than sreg




