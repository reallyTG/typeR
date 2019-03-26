library(SSDM)


### Name: mapDiversity
### Title: Map Diversity
### Aliases: mapDiversity mapDiversity mapDiversity,Stacked.SDM-method

### ** Examples


## Not run: 
##D # Loading data
##D data(Env)
##D data(Occurrences)
##D # SSDM building
##D SSDM <- stack_modelling(c('CTA', 'SVM'), Occurrences, Env, rep = 1,
##D                        Xcol = 'LONGITUDE', Ycol = 'LATITUDE',
##D                        Spcol = 'SPECIES')
##D 
##D # Diversity mapping
##D mapDiversity(SSDM, mathod = 'pSSDM')
##D 
## End(Not run)




