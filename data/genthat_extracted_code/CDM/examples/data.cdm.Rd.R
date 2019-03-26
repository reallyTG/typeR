library(CDM)


### Name: data.cdm
### Title: Several Datasets for the 'CDM' Package
### Aliases: data.cdm data.cdm01 data.cdm02 data.cdm03 data.cdm04
###   data.cdm05 data.cdm06 data.cdm07 data.cdm08
### Keywords: datasets

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Reduced RUM model, Chiu et al. (2016)
##D #############################################################################
##D 
##D data(data.cdm03, package="CDM")
##D dat <- data.cdm03$data
##D qmatrix <- data.cdm03$qmatrix
##D 
##D #*** Model 1: Reduced RUM
##D mod1 <- CDM::gdina( dat, q.matrix=qmatrix[,-1], rule="RRUM" )
##D summary(mod1)
##D 
##D #*** Model 2: Additive model with identity link function
##D mod2 <- CDM::gdina( dat, q.matrix=qmatrix[,-1], rule="ACDM" )
##D summary(mod2)
##D 
##D #*** Model 3: Additive model with logit link function
##D mod3 <- CDM::gdina( dat, q.matrix=qmatrix[,-1], rule="ACDM", linkfct="logit")
##D summary(mod3)
##D 
##D #############################################################################
##D # EXAMPLE 2: GDINA model - probability dataset from the pks package
##D #############################################################################
##D 
##D data(data.cdm05, package="CDM")
##D dat <- data.cdm05$data
##D Q <- data.cdm05$q.matrix
##D 
##D #* estimate model
##D mod1 <- CDM::gdina( dat, q.matrix=Q )
##D summary(mod1)
## End(Not run)



