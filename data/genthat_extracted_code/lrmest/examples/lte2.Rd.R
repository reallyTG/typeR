library(lrmest)


### Name: lte2
### Title: Type (2) Liu Estimator
### Aliases: lte2
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Portland cement data set is used.
data(pcd)
k<-0.1650
d<--0.1300
lte2(Y~X1+X2+X3+X4-1,k,d,data=pcd)      # Model without the intercept is considered.

## To obtain the variation of MSE of Type (2) Liu Estimator.
data(pcd)
k<-c(0:4/10)
d<-c(5:25/10)
msemat<-lte2(Y~X1+X2+X3+X4-1,k,d,data=pcd)
matplot(d,lte2(Y~X1+X2+X3+X4-1,k,d,data=pcd),type="l",ylab=c("MSE"),
main=c("Plot of MSE of Type (2) Liu Estimator"),
cex.lab=0.6,adj=1,cex.axis=0.6,cex.main=1,las=1,lty=3)
text(y=msemat[1,],x=d[1],labels=c(paste0("k=",k)),pos=4,cex=0.6)
 ## Use "press=TRUE" to obtain the variation of PRESS of Type (2) Liu Estimator.



