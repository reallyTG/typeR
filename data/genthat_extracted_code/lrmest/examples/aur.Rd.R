library(lrmest)


### Name: aur
### Title: Almost Unbiased Ridge Estimator
### Aliases: aur
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Portland cement data set is used.
data(pcd)
k<-0.05
aur(Y~X1+X2+X3+X4-1,k,data=pcd)   # Model without the intercept is considered.

## To obtain the variation of MSE of Almost Unbiased Ridge Estimator.
data(pcd)
k<-c(0:10/10)
plot(aur(Y~X1+X2+X3+X4-1,k,data=pcd),
main=c("Plot of MSE of Almost Unbiased Ridge Estimator"),type="b",
cex.lab=0.6,adj=1,cex.axis=0.6,cex.main=1,las=1,lty=3,cex=0.6)
mseval<-data.frame(aur(Y~X1+X2+X3+X4-1,k,data=pcd))
smse<-mseval[order(mseval[,2]),]
points(smse[1,],pch=16,cex=0.6)



