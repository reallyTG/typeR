library(costsensitive)


### Name: regression.one.vs.rest
### Title: Regression One-Vs-Rest
### Aliases: regression.one.vs.rest

### ** Examples

## Not run: 
##D library(costsensitive)
##D wrapped.lm <- function(X, y, ...) {
##D 	return(lm(y ~ ., data = X, ...))
##D }
##D set.seed(1)
##D X <- data.frame(feature1 = rnorm(100), feature2 = rnorm(100), feature3 = runif(100))
##D C <- data.frame(cost1 = rgamma(100, 1), cost2 = rgamma(100, 1), cost3 = rgamma(100, 1))
##D model <- regression.one.vs.rest(X, C, wrapped.lm)
##D predict(model, X, type = "class")
##D predict(model, X, type = "score")
##D print(model)
## End(Not run)



