library(imputeYn)


### Name: imputeYn-package
### Title: Imputing the Last Largest Censored Observation(s) Under Weighted
###   Least Squares
### Keywords: package

### ** Examples

#For uncorrelated dataset
data1<-data(n=100, p=4, r=0, b1=c(2,2,3,3), sig=1, Cper=0)
imp<-imputeYn(data1$x, data1$y, data1$delta, method = "condMean", beta=NULL)
imp



