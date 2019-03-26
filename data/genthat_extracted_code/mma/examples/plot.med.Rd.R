library(mma)


### Name: plot.med
### Title: Plot the mediation effect on the fitted med object
### Aliases: plot.med

### ** Examples

data("weight_behavior")
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,15]
 data.bin<-data.org(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),
  binref=c(1,1),catmed=5,catref=1,predref="M",alpha=0.4,alpha2=0.4)
temp1<-med(data=data.bin,n=2,seed=1)
temp2<-med(data=data.bin,n=2,seed=1,nonlinear=TRUE)
plot(temp1,data.bin,vari="exercises",xlim=c(0,50))
plot(temp2,data.bin,vari="sports")



