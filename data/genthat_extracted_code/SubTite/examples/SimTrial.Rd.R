library(SubTite)


### Name: SimTrial
### Title: Simulates a Sub-TITE trial design
### Aliases: SimTrial

### ** Examples

##Note: nSims  should be set larger than the example below.
nSims=1
##Specify reference toxicity time and target
T1=6
Target=.3
##Number of Groups
##Specify upper bound for determining if the lowest dose is too toxic in a subgroup
Upper=c(.95,.95)
##Maximum Sample Size
Nmax=40
##Standardized Dose Values and starting dose index
Dose=sort(rnorm(4))
DoseStart=1
##Hypermeans for linear terms
meanmu=2.21
meanslope=-.57
MeanInts = c(.46)
MeanSlopes = c(.04)
##Accrual Rate
Accrue=2
groupprob=c(.5,.5)
##Fill in Hyperparameter list for MCMC
Hyper=as.list(c(0,0,0,0))
Hyper[[1]]=meanmu
Hyper[[2]]=meanslope
Hyper[[3]]=MeanInts
Hyper[[4]]=MeanSlopes
Family="Uniform"
Param1 = matrix(c(.2,.3,.4,.5,.6,.1,.2,.3,.4,.5),byrow=TRUE,nrow=2)
Param2=Param1
VarInt=5
VarSlope=1
SimTrial(nSims,Nmax,T1,Target,Dose,DoseStart,
Upper,Accrue,groupprob,Hyper,Family,Param1,Param2,VarInt,VarSlope)



