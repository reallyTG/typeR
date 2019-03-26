library(grf)


### Name: grf
### Title: GRF
### Aliases: grf

### ** Examples

## Not run: 
##D library(grf)
##D 
##D # The following script demonstrates how to use GRF for heterogeneous treatment
##D # effect estimation. For examples of how to use other types of forest, as for
##D # quantile regression and causal effect estimation using instrumental variables,
##D # please consult the documentation on the relevant forest methods (quantile_forest,
##D # instrumental_forest, etc.).
##D 
##D # Generate data.
##D n = 2000; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D X.test = matrix(0, 101, p)
##D X.test[,1] = seq(-2, 2, length.out = 101)
##D 
##D # Train a causal forest.
##D W = rbinom(n, 1, 0.4 + 0.2 * (X[,1] > 0))
##D Y = pmax(X[,1], 0) * W + X[,2] + pmin(X[,3], 0) + rnorm(n)
##D tau.forest = causal_forest(X, Y, W)
##D 
##D # Estimate treatment effects for the training data using out-of-bag prediction.
##D tau.hat.oob = predict(tau.forest)
##D hist(tau.hat.oob$predictions)
##D 
##D # Estimate treatment effects for the test sample.
##D tau.hat = predict(tau.forest, X.test)
##D plot(X.test[,1], tau.hat$predictions, ylim = range(tau.hat$predictions, 0, 2),
##D 	xlab = "x", ylab = "tau", type = "l")
##D lines(X.test[,1], pmax(0, X.test[,1]), col = 2, lty = 2)
##D 
##D # Estimate the conditional average treatment effect on the full sample (CATE).
##D average_treatment_effect(tau.forest, target.sample = "all")
##D 
##D # Estimate the conditional average treatment effect on the treated sample (CATT).
##D # Here, we don't expect much difference between the CATE and the CATT, since
##D # treatment assignment was randomized.
##D average_treatment_effect(tau.forest, target.sample = "treated")
##D 
##D # Add confidence intervals for heterogeneous treatment effects; growing more
##D # trees is now recommended.
##D tau.forest = causal_forest(X, Y, W, num.trees = 4000)
##D tau.hat = predict(tau.forest, X.test, estimate.variance = TRUE)
##D sigma.hat = sqrt(tau.hat$variance.estimates)
##D 
##D ylim = range(tau.hat$predictions + 1.96 * sigma.hat, tau.hat$predictions - 1.96 * sigma.hat, 0, 2),
##D plot(X.test[,1], tau.hat$predictions, ylim = ylim, xlab = "x", ylab = "tau", type = "l")
##D lines(X.test[,1], tau.hat$predictions + 1.96 * sigma.hat, col = 1, lty = 2)
##D lines(X.test[,1], tau.hat$predictions - 1.96 * sigma.hat, col = 1, lty = 2)
##D lines(X.test[,1], pmax(0, X.test[,1]), col = 2, lty = 1)
##D 
##D # In some examples, pre-fitting models for Y and W separately may
##D # be helpful (e.g., if different models use different covariates).
##D # In some applications, one may even want to get Y.hat and W.hat
##D # using a completely different method (e.g., boosting).
##D 
##D # Generate new data.
##D n = 4000; p = 20
##D X = matrix(rnorm(n * p), n, p)
##D TAU = 1 / (1 + exp(-X[, 3]))
##D W = rbinom(n ,1, 1 / (1 + exp(-X[, 1] - X[, 2])))
##D Y = pmax(X[, 2] + X[, 3], 0) + rowMeans(X[, 4:6]) / 2 + W * TAU + rnorm(n)
##D 
##D forest.W = regression_forest(X, W, tune.parameters = TRUE)
##D W.hat = predict(forest.W)$predictions
##D 
##D forest.Y = regression_forest(X, Y, tune.parameters = TRUE)
##D Y.hat = predict(forest.Y)$predictions
##D 
##D forest.Y.varimp = variable_importance(forest.Y)
##D 
##D # Note: Forests may have a hard time when trained on very few variables
##D # (e.g., ncol(X) = 1, 2, or 3). We recommend not being too aggressive
##D # in selection.
##D selected.vars = which(forest.Y.varimp / mean(forest.Y.varimp) > 0.2)
##D 
##D tau.forest = causal_forest(X[, selected.vars], Y, W,
##D                            W.hat = W.hat, Y.hat = Y.hat,
##D                            tune.parameters = TRUE)
##D 
##D # Check whether causal forest predictions are well calibrated.
##D test_calibration(tau.forest)
## End(Not run)



