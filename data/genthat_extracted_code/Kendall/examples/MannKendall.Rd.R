library(Kendall)


### Name: MannKendall
### Title: Mann-Kendall trend test
### Aliases: MannKendall
### Keywords: nonparametric ts

### ** Examples

# Annual precipitation entire Great Lakes
# The time series plot with lowess smooth suggests an upward trend
# The autocorrelation in this data does not appear significant.
# The Mann-Kendall trend test confirms the upward trend.
data(PrecipGL)
plot(PrecipGL)
lines(lowess(time(PrecipGL),PrecipGL),lwd=3, col=2)
acf(PrecipGL)
MannKendall(PrecipGL)
#
#Use block bootstrap 
library(boot)
data(PrecipGL)
MKtau<-function(z) MannKendall(z)$tau
tsboot(PrecipGL, MKtau, R=500, l=5, sim="fixed")
#
# Deseasonalize a monthly time series and use the block bootstrap
library(boot)
data(manaus)
z<-matrix(manaus, ncol=12, byrow=12)
zm<-apply(z, MARGIN=2, FUN=mean)
zs<-apply(z, MARGIN=2, FUN=sd)
z2<-sweep(z, MARGIN=2, STATS=zm) #subtract monthly means
z3<-sweep(z2, MARGIN=2, STATS=zs, FUN="/") #divide by monthly sd
zds<-c(t(z3)) 
attributes(zds)<-attributes(manaus)
plot(zds)
#do Mann-Kendall trend test
MannKendall(zds)
#check robustness by applying block bootstrap
MKtau<-function(z) MannKendall(z)$tau
tsboot(zds, MKtau, R=500, l=12, sim="fixed")
#the significance level has dropped!
#it is significant now at about 2 sd



