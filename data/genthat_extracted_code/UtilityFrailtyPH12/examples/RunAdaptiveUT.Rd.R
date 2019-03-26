library(UtilityFrailtyPH12)


### Name: RunAdaptiveUT
### Title: Simulates replications from the monotone utility based phase 12
###   trial.
### Aliases: RunAdaptiveUT

### ** Examples

library(bindata)
library(mvtnorm)
##Trial PArameters here
Nmax=30 ##Number of patients to enroll
NF=30 ##Number until AR if NF=Nmax, there's no AR.
cohort=3
##UTILITIES
UT = matrix(c(38.23529,100,0,61.76471),nrow=2,byrow=TRUE)
##Safety Parameters
CutE=.3
CutT=.4
AcceptE=.1
AcceptT=.1
##Hyperparameters for Utility
HypermeansE=c(-1.189, -0.357,  0.360,  0.546,  0.743)
HypermeansT=c(-2.325, -1.811, -1.464, -1.189, -0.740)
Hypervars=c(1,36,1)
#True Efficacy and Toxicity probabilities
PE=c(.2,.4,.6,.7,.7)
PT=c(.2,.2,.2,.3,.5)
corET=0
##Number of simulations
NSims=2
RESULTS=RunAdaptiveUT(NSims, PE, PT, corET,  Nmax, 
cohort,NF, UT, CutE, CutT, AcceptE, 
AcceptT, HypermeansE, HypermeansT, Hypervars)



