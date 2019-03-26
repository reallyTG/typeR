library(CDM)


### Name: IRT.IC
### Title: Information Criteria
### Aliases: IRT.IC
### Keywords: Information criteria

### ** Examples

#############################################################################
# EXAMPLE 1: DINA example information criteria
#############################################################################

data(sim.dina, package="CDM")
data(sim.qmatrix, package="CDM")

#*** Model 1: DINA model
mod1 <- CDM::din( sim.dina, q.matrix=sim.qmatrix )
summary(mod1)
IRT.IC(mod1)



