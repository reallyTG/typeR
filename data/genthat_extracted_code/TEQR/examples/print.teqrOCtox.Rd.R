library(TEQR)


### Name: print.teqrOCtox
### Title: print.teqrOCtox
### Aliases: print.teqrOCtox
### Keywords: print

### ** Examples

set.seed(1111)

OperChar<-teqrOCtox(
sim=500,
firstdose=2,
probt=c(0.05,0.15,0.23,0.34,0.51,0.76), 
cohortSize=3,
MaxNoCohorts=30,
MTDss=12,
pTarget=0.2,
eq1=0.05,
eq2=0.05,
tootoxic=0.34)
OperChar



