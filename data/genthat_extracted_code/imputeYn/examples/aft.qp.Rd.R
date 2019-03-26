library(imputeYn)


### Name: aft.qp
### Title: Fiting Regularized Weighted Least Squares Method by Quadratic
###   Programming
### Aliases: aft.qp
### Keywords: AFT model

### ** Examples

# For uncorrelated dataset
data1<-data(n=100, p=2, r=0, b1=c(2,4), sig=1, Cper=0)
fit<-aft.qp(data1$x, data1$y, data1$delta)
fit

# For correlated dataset
data2<-data(n=100, p=2, r=0.5, b1=c(2,4), sig=1, Cper=0)
fit2<-aft.qp(data2$x, data2$y, data2$delta)
fit2



