library(CDM)


### Name: IRT.classify
### Title: Individual Classification for Fitted Models
### Aliases: IRT.classify

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Individual classification data.ecpe
##D #############################################################################
##D 
##D data(data.ecpe, package="CDM")
##D dat <- data.ecpe$dat[,-1]
##D Q <- data.ecpe$q.matrix
##D 
##D #** estimate GDINA model
##D mod <- CDM::gdina(dat, q.matrix=Q)
##D summary(mod)
##D 
##D #** classify individuals
##D cmod <- CDM::IRT.classify(mod)
##D str(cmod)
## End(Not run)



