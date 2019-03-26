library(SPOT)


### Name: buildRandomForest
### Title: Random Forest Interface
### Aliases: buildRandomForest

### ** Examples

## Not run: 
##D ## Test-function:
##D braninFunction <- function (x) {	
##D 	(x[2]  - 5.1/(4 * pi^2) * (x[1] ^2) + 5/pi * x[1]  - 6)^2 + 
##D 10 * (1 - 1/(8 * pi)) * cos(x[1] ) + 10
##D }
##D ## Create design points
##D set.seed(1)
##D x <- cbind(runif(20)*15-5,runif(20)*15)
##D ## Compute observations at design points (for Branin function)
##D y <- as.matrix(apply(x,1,braninFunction))
##D ## Create model
##D fit <- buildRandomForest(x,y,control = list(algTheta=optimLHD))
##D ## Print model parameters
##D print(fit)
##D ## Predict at new location
##D predict(fit,cbind(1,2))
##D ## True value at location
##D braninFunction(c(1,2))
## End(Not run)



