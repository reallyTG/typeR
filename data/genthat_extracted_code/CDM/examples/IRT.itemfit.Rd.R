library(CDM)


### Name: IRT.itemfit
### Title: S3 Methods for Computing Item Fit
### Aliases: IRT.itemfit IRT.itemfit.din IRT.itemfit.gdina IRT.itemfit.gdm
###   IRT.itemfit.slca IRT.itemfit.reglca
### Keywords: Item fit

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: DINA model item fit
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D # estimate model
##D mod1 <- CDM::din( sim.dina, q.matrix=sim.qmatrix)
##D # compute item fit
##D IRT.itemfit( mod1 )
## End(Not run)



