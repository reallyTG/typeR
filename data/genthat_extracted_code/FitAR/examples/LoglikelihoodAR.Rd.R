library(FitAR)


### Name: LoglikelihoodAR
### Title: Exact Loglikelihood for AR
### Aliases: LoglikelihoodAR
### Keywords: ts

### ** Examples

#Fit a subset model to Series A and verify the loglikelihood
 out<-FitAR(SeriesA, c(1,2,7))
 out
#either using print.default(out) to see the components in out
#or applying LoglikelihoodAR () by first obtaining the phi parameters as out$phiHat.

#
 LoglikelihoodAR(out$phiHat, SeriesA, MeanValue=mean(SeriesA))




