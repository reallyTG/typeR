library(TEQR)


### Name: teqrOCact
### Title: Activity Constrained for Toxicity (ACT) design trial simulator
### Aliases: teqrOCact
### Keywords: design

### ** Examples

set.seed(1111)
OperChar<-teqrOCact(
sim=500,
firstdose=2,
proba=c(0.65,0.75,0.85,1.00), 
probc=c(0.10,0.20,0.30,0.40),
cohortSize=3,
MaxNoCohorts=30,
RP2Dss=12,
pTarget=1.00,  
eq1=0.34,
eq2=0.0,
toxcon=0.34,
llactivity=0.66)
OperChar



