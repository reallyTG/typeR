library(SSDM)


### Name: ensemble_modelling
### Title: Build an ensemble SDM that assembles multiple algorithms
### Aliases: ensemble_modelling

### ** Examples

## Not run: 
##D # Loading data
##D data(Env)
##D data(Occurrences)
##D Occurrences <- subset(Occurrences, Occurrences$SPECIES == 'elliptica')
##D 
##D # ensemble SDM building
##D ESDM <- ensemble_modelling(c('CTA', 'MARS'), Occurrences, Env, rep = 1,
##D                           Xcol = 'LONGITUDE', Ycol = 'LATITUDE',
##D                           ensemble.thresh = c(0.6))
##D 
##D # Results plotting
##D plot(ESDM)
## End(Not run)




