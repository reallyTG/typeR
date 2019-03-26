library(imputeYn)


### Name: imputeYn
### Title: Imputing the Censored Largest Datum Under Weighted Least Squares
###   Method
### Aliases: imputeYn
### Keywords: imputation

### ** Examples

# For uncorrelated dataset
data1<-data(n=100, p=4, r=0, b1=c(2,2,3,3), sig=1, Cper=0)
imp<-imputeYn(data1$x, data1$y, data1$delta, method = "condMean", beta=NULL)
imp

# For correlated dataset
data2<-data(n=100, p=4, r=0.5, b1=c(2,2,3,3), sig=1, Cper=0)
imp2<-imputeYn(data2$x, data2$y, data2$delta, method = "condMean", beta=NULL)
imp2



