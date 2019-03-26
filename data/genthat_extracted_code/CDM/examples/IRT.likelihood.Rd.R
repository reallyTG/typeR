library(CDM)


### Name: IRT.likelihood
### Title: S3 Methods for Extracting of the Individual Likelihood and the
###   Individual Posterior
### Aliases: IRT.likelihood IRT.posterior IRT.likelihood.din
###   IRT.likelihood.gdina IRT.likelihood.mcdina IRT.likelihood.gdm
###   IRT.likelihood.slca IRT.likelihood.reglca IRT.posterior.din
###   IRT.posterior.gdina IRT.posterior.mcdina IRT.posterior.gdm
###   IRT.posterior.slca IRT.posterior.reglca
### Keywords: Individual likelihood Individual posterior

### ** Examples

#############################################################################
# EXAMPLE 1: Extracting likelihood and posterior from a DINA model
#############################################################################

data(sim.dina, package="CDM")
data(sim.qmatrix, package="CDM")

#*** estimate model
mod1 <- CDM::din( sim.dina, q.matrix=sim.qmatrix, rule="DINA")
#*** extract likelihood
likemod1 <- CDM::IRT.likelihood(mod1)
str(likemod1)
# extract theta
attr(likemod1, "theta" )
#*** extract posterior
pomod1 <- CDM::IRT.posterior( mod1 )
str(pomod1)



