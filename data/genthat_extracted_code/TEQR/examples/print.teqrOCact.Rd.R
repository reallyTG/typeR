library(TEQR)


### Name: print.teqrOCact
### Title: print.teqrOCact
### Aliases: print.teqrOCact
### Keywords: print

### ** Examples

set.seed(1111)
OperChar<-teqrOCact(
sim=1000,
firstdose=2,
proba=c(0.50,0.80,0.90), 
probc=c(0.10,0.10,0.10),
cohortSize=3,
MaxNoCohorts=30,
RP2Dss=6,
pTarget=1.00,  
eq1=0.34,
eq2=0.0,
toxcon=0.34,
llactivity=0.66)
OperChar



