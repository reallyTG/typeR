library(mma)


### Name: boot.med.par
### Title: Statistical Inference on Mediation Analysis Using Parallel
###   Computing
### Aliases: boot.med.par
### Keywords: Mediation Analysis Continuous Predictor

### ** Examples

## No test: 
library(doParallel)
data("weight_behavior")
##binary x
#binary y
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,15]
 data.bin<-data.org(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),binref=c(1,1),
                    catmed=5,catref=1,predref="M",alpha=0.4,alpha2=0.4)
 temp1<-boot.med.par(data=data.bin,n=2,n2=4,seed=1)
 temp2<-boot.med.par(data=data.bin,n=2,n2=4,nu=0.05,seed=1,nonlinear=TRUE)
## End(No test)



