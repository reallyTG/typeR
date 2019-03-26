library(dominanceanalysis)


### Name: mlmWithCov
### Title: Uses covariance/correlation matrix to calculate multivariate
###   index of fit
### Aliases: mlmWithCov

### ** Examples

library(car)
library(heplots)
cor.m<-cor(Rohwer[Rohwer[,1]==1,2+c(7,8,1,2,3)])
lwith<-mlmWithCov(cbind(na,ss)~SAT+PPVT+Raven,cor.m)
da<-dominanceAnalysis(lwith)
print(da)
summary(da)



