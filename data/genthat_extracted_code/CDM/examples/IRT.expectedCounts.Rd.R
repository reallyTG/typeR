library(CDM)


### Name: IRT.expectedCounts
### Title: S3 Method for Extracting Expected Counts
### Aliases: IRT.expectedCounts IRT.expectedCounts.din
###   IRT.expectedCounts.gdina IRT.expectedCounts.mcdina
###   IRT.expectedCounts.gdm IRT.expectedCounts.slca
###   IRT.expectedCounts.reglca
### Keywords: Expected counts

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Expected counts gdm function
##D #############################################################################
##D 
##D data(data.fraction1, package="CDM")
##D dat <- data.fraction1$data
##D theta.k <- seq( -6, 6, len=11 )   # discretized ability
##D 
##D #--- Model 1: Rasch model
##D mod1 <- CDM::gdm( dat, irtmodel="1PL", theta.k=theta.k, skillspace="normal",
##D                centered.latent=TRUE )
##D emod1 <- CDM::IRT.expectedCounts(mod1)
##D str(emod1)
##D 
##D #############################################################################
##D # EXAMPLE 2: Expected counts gdina function
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D #--- Model 1: estimation of the GDINA model
##D mod1 <- CDM::gdina( data=sim.dina, q.matrix=sim.qmatrix)
##D summary(mod1)
##D emod1 <- CDM::IRT.expectedCounts(mod1)
##D str(emod1)
##D 
##D #--- Model 2: GDINA model with two groups
##D mod2 <- CDM::gdina( data=CDM::sim.dina, q.matrix=CDM::sim.qmatrix,
##D                    group=rep(1:2, each=200) )
##D summary(mod2)
##D emod2 <- CDM::IRT.expectedCounts( mod2 )
##D str(emod2)
## End(Not run)



