library(eggCounts)


### Name: fec_stan
### Title: Modelling of faecal egg count data (one-sample case)
### Aliases: fec_stan
### Keywords: modelling

### ** Examples

## Not run: 
##D ## load the sample data
##D data(epgs)
##D 
##D ## apply zero-infation model
##D model <- fec_stan(epgs$before, rawCounts=FALSE, CF=50)
##D samples <- stan2mcmc(model$stan.samples)
## End(Not run)


