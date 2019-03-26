library(lrmest)


### Name: ogalt3
### Title: Ordinary Generalized Type (3) Adjusted Liu Estimator
### Aliases: ogalt3
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Portland cement data set is used.
data(pcd)
k<-0.1650
d<--0.1300
aa<-c(0.958451,1.021155,0.857821,1.040296)
ogalt3(Y~X1+X2+X3+X4-1,k,d,aa,data=pcd)      
# Model without the intercept is considered.
      
 ## To obtain the variation of MSE of Ordinary Generalized 
 # Type (3) Adjusted Liu Estimator.
data(pcd)
k<-c(0:5/10)
d<-c(-420:-380/10)
aa<-c(0.958451,1.021155,0.857821,1.040296)
msemat<-ogalt3(Y~X1+X2+X3+X4-1,k,d,aa,data=pcd)
matplot(d,ogalt3(Y~X1+X2+X3+X4-1,k,d,aa,data=pcd),type="l",ylab=c("MSE"),
main=c("Plot of MSE of Ordinary Generalized Type (3) Adjusted Liu 
Estimator"),cex.lab=0.6,adj=1,cex.axis=0.6,cex.main=1,las=1,lty=3)
text(y=msemat[1,],x=d[1],labels=c(paste0("k=",k)),pos=4,cex=0.6)



