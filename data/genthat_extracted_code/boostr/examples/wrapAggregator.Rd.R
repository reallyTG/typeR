library(boostr)


### Name: wrapAggregator
### Title: Create a boostr compatible wrapper for an aggregator.
### Aliases: wrapAggregator

### ** Examples

## Not run: 
##D testAggregator <- function(ensemble) {
##D  weights <- runif(min=0, max=1, n=length(ensemble))
##D  function(x) {
##D    preds <- foreach(estimator = iter(ensemble),
##D                   .combine = rbind) %do% {
##D                     matrix(as.character(estimator(x)), nrow=1)
##D                   }
##D 
##D    as.factor(predictClassFromWeightedVote(preds, weights))
##D  }
##D }
##D 
##D wrappedAggregator <- wrapAggregator(testAggregator,
##D                                     .inputEnsemble="ensemble")
## End(Not run)



