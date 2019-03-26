library(jackknifeKME)


### Name: jackknifeKME-package
### Title: Jackknife Estimates of Kaplan-Meier Estimators or Integrals
### Keywords: jackknife imputeYn

### ** Examples

#For full data typically used for AFT models (using imputeYn (2015) package).
#For mean lifetime estimator.
data1<-data(n=100, p=4, r=0, b1=c(2,2,3,3), sig=1, Cper=0)
kme1<-jackknifeKME(data1$x,data1$y, data1$delta, method="condMean",estimator = 1)
kme1



