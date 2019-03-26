library(eggCounts)


### Name: fecr_stanSimple
### Title: Modelling the reduction of faecal egg count data using a simple
###   Bayesian model
### Aliases: fecr_stanSimple
### Keywords: modelling

### ** Examples

## Not run: 
##D ## load sample data
##D data(epgs)
##D 
##D ## apply paired model with individual efficacy
##D model <- fecr_stanSimple(epgs$before, epgs$after, rawCounts=FALSE, preCF=10)
##D samples <- stan2mcmc(model$stan.samples)
##D 
## End(Not run)


