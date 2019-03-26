library(EstSimPDMP)


### Name: CondPdf.DC
### Title: Estimation of the density associated to the jump rate for
###   piecewise-deterministic Markov processes (discrete state space)
### Aliases: CondPdf.DC

### ** Examples

# CondPdf.DC

# Simulation of a PDMP with discrete state space
dat<-Simu.PDMP.DC(1,200,verbose=FALSE)

# Estimation of the conditional density given state=2 at time 2
CondPdf.DC(dat,2,2,bound=5.8)



