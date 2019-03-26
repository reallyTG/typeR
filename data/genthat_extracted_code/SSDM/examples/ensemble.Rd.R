library(SSDM)


### Name: ensemble
### Title: Methods to assemble multiple algorithms in an ensemble SDM
### Aliases: ensemble ensemble,Algorithm.SDM-method
###   sum,Algorithm.SDM-method

### ** Examples

## Not run: 
##D # Loading data
##D data(Env)
##D data(Occurrences)
##D Occurrences <- subset(Occurrences, Occurrences$SPECIES == 'elliptica')
##D 
##D # ensemble SDM building
##D CTA <- modelling('CTA', Occurrences, Env, Xcol = 'LONGITUDE', Ycol = 'LATITUDE')
##D SVM <- modelling('SVM', Occurrences, Env, Xcol = 'LONGITUDE', Ycol = 'LATITUDE')
##D ESDM <- ensemble(CTA, SVM, ensemble.thresh = c(0.6))
##D 
##D # Results plotting
##D plot(ESDM)
## End(Not run)




