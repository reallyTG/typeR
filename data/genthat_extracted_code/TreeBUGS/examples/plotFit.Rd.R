library(TreeBUGS)


### Name: plotFit
### Title: Plot Posterior Predictive Mean Frequencies
### Aliases: plotFit

### ** Examples

## Not run: 
##D # add posterior predictive samples to fitted model:
##D fittedModel$postpred$freq.pred <-
##D      posteriorPredictive(fittedModel, M=1000)
##D 
##D # plot model fit
##D plotFit(fittedModel, stat = "mean")
## End(Not run)



