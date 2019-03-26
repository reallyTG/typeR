library(grf)


### Name: average_treatment_effect
### Title: Estimate average treatment effects using a causal forest
### Aliases: average_treatment_effect

### ** Examples

## Not run: 
##D # Train a causal forest.
##D n = 50; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D W = rbinom(n, 1, 0.5)
##D Y = pmax(X[,1], 0) * W + X[,2] + pmin(X[,3], 0) + rnorm(n)
##D c.forest = causal_forest(X, Y, W)
##D 
##D # Predict using the forest.
##D X.test = matrix(0, 101, p)
##D X.test[,1] = seq(-2, 2, length.out = 101)
##D c.pred = predict(c.forest, X.test)
##D # Estimate the conditional average treatment effect on the full sample (CATE).
##D average_treatment_effect(c.forest, target.sample = "all")
##D 
##D # Estimate the conditional average treatment effect on the treated sample (CATT).
##D # We don't expect much difference between the CATE and the CATT in this example,
##D # since treatment assignment was randomized.
##D average_treatment_effect(c.forest, target.sample = "treated")
##D 
##D # Estimate the conditional average treatment effect on samples with positive X[,1].
##D average_treatment_effect(c.forest, target.sample = "all", X[,1] > 0)
## End(Not run)




