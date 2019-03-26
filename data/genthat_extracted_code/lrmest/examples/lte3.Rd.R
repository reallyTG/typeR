library(lrmest)


### Name: lte3
### Title: Type (3) Liu Estimator
### Aliases: lte3
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Portland cement data set is used.
data(pcd)
k<-0.1650
d<--0.1300
lte3(Y~X1+X2+X3+X4-1,k,d,data=pcd)   # Model without the intercept is considered.

## To obtain the variation of MSE of Type (3) Liu Estimator.
data(pcd)
k<-c(50:51/10)
d<-c(300:305/10)
msemat<-lte3(Y~X1+X2+X3+X4-1,k,d,data=pcd)
matplot(d,lte3(Y~X1+X2+X3+X4-1,k,d,data=pcd),type="l",ylab=c("MSE"),
main=c("Plot of MSE of Type (3) Liu Estimator"),
cex.lab=0.6,adj=1,cex.axis=0.6,cex.main=1,las=1,lty=3)
text(y=msemat[1,],x=d[1],labels=c(paste0("k=",k)),pos=4,cex=0.6)
 ## Use "press=TRUE" to obtain the variation of PRESS of Type (3) Liu Estimator.



