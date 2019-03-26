library(lrmest)


### Name: ogrliu
### Title: Ordinary Generalized Restricted Liu Estimator
### Aliases: ogrliu
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(pcd)
d<-0.05
r<-c(2.1930,1.1533,0.75850)
R<-c(1,0,0,0,0,1,0,0,0,0,1,0)
delt<-c(0,0,0)
ogrliu(Y~X1+X2+X3+X4-1,r,R,delt,d,data=pcd)    
# Model without the intercept is considered.
 
## To obtain the variation of MSE of 
# Ordinary Generalized Resticted Liu Estimator.
data(pcd)
d<-c(0:10/10)
r<-c(2.1930,1.1533,0.75850)
R<-c(1,0,0,0,0,1,0,0,0,0,1,0)
delt<-c(0,0,0)
plot(ogrliu(Y~X1+X2+X3+X4-1,r,R,delt,d,data=pcd),
main=c("Plot of MSE of Ordinary Generalized Restricted Liu 
Estimator"),type="b",cex.lab=0.6,adj=1,cex.axis=0.6,cex.main=1,las=1,lty=3,cex=0.6)
mseval<-data.frame(ogrliu(Y~X1+X2+X3+X4-1,r,R,delt,d,data=pcd))
smse<-mseval[order(mseval[,2]),]
points(smse[1,],pch=16,cex=0.6)



