library(SSDM)


### Name: stack_modelling
### Title: Build an SSDM that assembles multiple algorithms and species.
### Aliases: stack_modelling

### ** Examples

## Not run: 
##D # Loading data
##D data(Env)
##D data(Occurrences)
##D 
##D # SSDM building
##D SSDM <- stack_modelling(c('CTA', 'SVM'), Occurrences, Env, rep = 1,
##D                        Xcol = 'LONGITUDE', Ycol = 'LATITUDE',
##D                        Spcol = 'SPECIES')
##D 
##D # Results plotting
##D plot(SSDM)
## End(Not run)




