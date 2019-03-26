library(eggCounts)


### Name: stan2mcmc
### Title: Convert a Stanfit object to MCMC object
### Aliases: stan2mcmc
### Keywords: modelling

### ** Examples

## Not run: 
##D data(epgs)
##D 
##D ## apply zero-infation model for the paired design 
##D model <- fecr_stan(epgs$before, epgs$after, rawCounts = FALSE, indEfficacy = FALSE,
##D                    preCF = 10, paired = TRUE, zeroInflation = TRUE)
##D samples <- stan2mcmc(model$stan.samples)
##D summary(samples)
## End(Not run)


