library(FitAR)


### Name: GetLeapsAR
### Title: Select lags for Best Subset ARp Model
### Aliases: GetLeapsAR
### Keywords: ts

### ** Examples

#Example 1: Simple Example
#for the log(lynx) Tong (1977) selected an ARp(1,2,4,10,11)
#using the AIC and a subset selection algorithm. Our more exact
#approach shows that the ARp(1,2,3,4,10,11) has slightly lower
#AIC (using exact likelihood evaluation).  
z<-log(lynx)
GetLeapsAR(z, lag.max=11)
GetLeapsAR(z, lag.max=11, Criterion="BIC")

#Example 2: Subset autoregression depends on lag.max!
#Because least-squares is used, P=lag.max observations are
#  are deleted. This causes different results depending on lag.max.
#This phenomenon does not happen with "ARz" subset models
#ARp models depend on lag.max
GetLeapsAR(z, lag.max=15, Criterion="BIC")
GetLeapsAR(z, lag.max=20, Criterion="BIC")

#Example 3: Comparing GIC with BIC, AIC, UBIC and BICq
z <- log(lynx)
GetLeapsAR(z, lag.max=15, Criterion="BIC", Best=1)
GetLeapsAR(z, lag.max=15, Criterion="AIC", Best=1)
GetLeapsAR(z, lag.max=15, Criterion="UBIC", Best=1)
GetLeapsAR(z, lag.max=15, Criterion="BICq", Best=1, t=0.25)
GetLeapsAR(z, lag.max=15, Best=1, Criterion="GIC", t=0.01)
ans<-GetLeapsAR(z, lag.max=15, Best=3, Criterion="GIC", t=0.001)
plot(ans)



