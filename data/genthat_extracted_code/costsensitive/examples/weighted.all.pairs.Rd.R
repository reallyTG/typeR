library(costsensitive)


### Name: weighted.all.pairs
### Title: Weighted All-Pairs
### Aliases: weighted.all.pairs

### ** Examples

## Not run: 
##D library(costsensitive)
##D wrapped.logistic <- function(X, y, weights, ...) {
##D 	return(glm(y ~ ., data = X, weights = weights, family = "binomial", ...))
##D }
##D set.seed(1)
##D X <- data.frame(feature1 = rnorm(100), feature2 = rnorm(100), feature3 = runif(100))
##D C <- data.frame(cost1 = rgamma(100, 1), cost2 = rgamma(100, 1), cost3 = rgamma(100, 1))
##D model <- weighted.all.pairs(X, C, wrapped.logistic, predict_type_prob = "response")
##D predict(model, X, type = "class")
##D predict(model, X, type = "score")
##D print(model)
## End(Not run)



