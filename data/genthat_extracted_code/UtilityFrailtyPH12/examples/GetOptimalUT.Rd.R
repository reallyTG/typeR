library(UtilityFrailtyPH12)


### Name: GetOptimalUT
### Title: Gives the dose to assign the next patient cohort using monotone
###   utility based phase 12 trial.
### Aliases: GetOptimalUT

### ** Examples

library(mvtnorm)
##Data Here
YE=rbinom(30,1,.8)
YT=rbinom(30,1,.3)
Doses=sample(1:3,30,replace=TRUE)
DoseTried=c(1,1,1,0,0)
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
##Adaptively randomize or not?
AR=FALSE
GetOptimalUT( YE,YT, Doses,DoseTried,AR, UT, CutE, CutT,
AcceptE, AcceptT, HypermeansE, HypermeansT,Hypervars)



