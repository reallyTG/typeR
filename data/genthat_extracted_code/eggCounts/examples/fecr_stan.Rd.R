library(eggCounts)


### Name: fecr_stan
### Title: Modelling the reduction of faecal egg count data
### Aliases: fecr_stan
### Keywords: modelling

### ** Examples

## Not run: 
##D ## load sample data
##D data(epgs)
##D 
##D ## apply paired model with individual efficacy
##D model <- fecr_stan(epgs$before, epgs$after, rawCounts=FALSE, preCF=50, 
##D                    paired=TRUE, indEfficacy = TRUE)
##D samples <- stan2mcmc(model$stan.samples)
## End(Not run)


