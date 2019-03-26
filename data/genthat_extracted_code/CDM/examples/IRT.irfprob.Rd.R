library(CDM)


### Name: IRT.irfprob
### Title: S3 Methods for Extracting Item Response Functions
### Aliases: IRT.irfprob IRT.irfprob.din IRT.irfprob.gdina
###   IRT.irfprob.mcdina IRT.irfprob.gdm IRT.irfprob.slca
###   IRT.irfprob.reglca

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Extracting item response functions mcdina model
##D #############################################################################
##D 
##D data(data.cdm02, package="CDM")
##D 
##D dat <- data.cdm02$data
##D q.matrix <- data.cdm02$q.matrix
##D 
##D #-- estimate model
##D mod1 <- CDM::mcdina( dat, q.matrix=q.matrix)
##D #-- extract item response functions
##D prmod1 <- CDM::IRT.irfprob(mod1)
##D str(prmod1)
## End(Not run)



