library(Rborist)


### Name: predict.Rborist
### Title: predict method for Rborst
### Aliases: predict.Rborist

### ** Examples

## Not run: 
##D   # Regression example:
##D   nRow <- 5000
##D   x <- data.frame(replicate(6, rnorm(nRow)))
##D   y <- with(x, X1^2 + sin(X2) + X3 * X4) # courtesy of S. Welling.
##D   rb <- Rborist(x,y)
##D 
##D 
##D   # Performs separate prediction on new data:
##D   xx <- data.frame(replace(6, rnorm(nRow)))
##D   pred <- predict(rb, xx)
##D   yPred <- pred$yPred
##D 
##D 
##D   # Performs separate prediction, using original response as test
##D   # vector:
##D   pred <- predict(rb, xx, y)
##D   mse <- pred$mse
##D   rsq <- pred$rsq
##D 
##D 
##D   # Performs separate prediction with (default) quantiles:
##D   pred <- predict(rb, xx, quantiles="TRUE")
##D   qPred <- pred$qPred
##D 
##D 
##D   # Performs separate prediction with deciles:
##D   pred <- predict(rb, xx, quantVec = seq(0.1, 1.0, by = 0.10))
##D   qPred <- pred$qPred
##D 
##D 
##D   # Performs separate quantile prediction with high binning factor:
##D   pred <- predict(rb, xx, qBin=20000, quantiles="TRUE")
##D   qPred <- pred$pPred
##D 
##D 
##D   # Classification examples:
##D   data(iris)
##D   rb <- Rborist(iris[-5], iris[5])
##D 
##D 
##D   # Generic prediction using training set.
##D   # Census as (default) votes:
##D   pred <- predict(rb, iris[-5])
##D   yPred <- pred$yPred
##D   census <- pred$census
##D 
##D 
##D   # As above, but validation census to report class probabilities:
##D   pred <- predict(rb, iris[-5], ctgCensus="prob")
##D   prob <- pred$prob
##D 
##D 
##D   # As above, but with training reponse as test vector:
##D   pred <- predict(rb, iris[-5], iris[5], ctgCensus = "prob")
##D   prob <- pred$prob
##D   conf <- pred$confusion
##D   misPred <- pred$misPred
## End(Not run)



