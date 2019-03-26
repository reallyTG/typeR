library(lrmest)


### Name: liu
### Title: Liu Estimator
### Aliases: liu
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Portland cement data set is used.
data(pcd)
d<-0.05
liu(Y~X1+X2+X3+X4-1,d,data=pcd)   # Model without the intercept is considered.

## To obtain the variation of MSE of Liu Estimator.
data(pcd)
d<-c(0:10/10)
plot(liu(Y~X1+X2+X3+X4-1,d,data=pcd),main=c("Plot of MSE of Liu Estimator"),
type="b",cex.lab=0.6,adj=1,cex.axis=0.6,cex.main=1,las=1,lty=3,cex=0.6)
mseval<-data.frame(liu(Y~X1+X2+X3+X4-1,d,data=pcd))
smse<-mseval[order(mseval[,2]),]
points(smse[1,],pch=16,cex=0.6)



