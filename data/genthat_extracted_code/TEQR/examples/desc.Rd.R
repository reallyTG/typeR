library(TEQR)


### Name: desc
### Title: Descriptive Statistics
### Aliases: desc
### Keywords: statistics

### ** Examples

set.seed(1111)
OperChar<-teqrOCtox(
sim=500,
firstdose=2,
probt=c(.05,.15,.23,.34,.51,.76), 
cohortSize=3,
MaxNoCohorts=30,
MTDss=12,
pTarget=.2,
eq1=.05,
eq2=.05,
tootoxic=.34)
OperChar
TotalN<-rep(NA,500)
for (i in 1:500){
TotalN[i]<-sum(OperChar$DLdata$dllength[OperChar$DLdata$simNo==i])
}
desc(TotalN)



