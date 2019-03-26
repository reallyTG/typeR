library(icsurvROC)


### Name: icsurvROC
### Title: Interval Censored survival ROC
### Aliases: icsurvROC
### Keywords: Semiparametric Cox proportional hazards, local NPMLE, maximum
###   likelihood croos validation

### ** Examples

Time=   c(1,2,5,3,9,8,9,4,6,4)
Status= c(1,1,1,0,1,1,1,0,0,0)
Marker= c(8,2,6,3,1,4,5,1,3,7)

#np at year 3
nobs=length(Time)
span=sd(Marker)*nobs^(-1/7)
RES1=icsurvROC(Time, Status, Marker, pred.time=3, method="np", span=span)
print(RES1)

#sp at year 3
RES2=icsurvROC(Time, Status, Marker, pred.time=3, method="sp")
print(RES2)



