library(eggCounts)


### Name: fecr_probs
### Title: Compute the probability of the reduction parameter relative to
###   the given threshold
### Aliases: fecr_probs
### Keywords: modelling

### ** Examples

## Not run: 
##D ## load sample data
##D data(epgs)
##D 
##D ## apply zero-infation model to the data vector
##D model <- fecr_stan(epgs$before, epgs$after, rawCounts=FALSE, preCF=10, 
##D                    paired=TRUE, zeroInflation=TRUE)
##D fecr_probs(model$stan.samples)
## End(Not run)


