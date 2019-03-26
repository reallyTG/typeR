library(SSDM)


### Name: stacking
### Title: Stack different ensemble SDMs in an SSDM
### Aliases: stacking stacking,Ensemble.SDM-method

### ** Examples

## Not run: 
##D # Loading data
##D data(Env)
##D data(Occurrences)
##D Occ1 <- subset(Occurrences, Occurrences$SPECIES == 'elliptica')
##D Occ2 <- subset(Occurrences, Occurrences$SPECIES == 'gracilis')
##D 
##D # SSDM building
##D ESDM1 <- ensemble_modelling(c('CTA', 'SVM'), Occ1, Env, rep = 1,
##D                            Xcol = 'LONGITUDE', Ycol = 'LATITUDE',
##D                            name = 'elliptica', ensemble.thresh = c(0.6))
##D ESDM2 <- ensemble_modelling(c('CTA', 'SVM'), Occ2, Env, rep = 1,
##D                            Xcol = 'LONGITUDE', Ycol = 'LATITUDE',
##D                            name = 'gracilis', ensemble.thresh = c(0.6))
##D SSDM <- stacking(ESDM1, ESDM2)
##D 
##D # Results plotting
##D plot(SSDM)
## End(Not run)




