library(mma)


### Name: mma.par
### Title: Multiple Mediation Analysis Using Parallel Computing
### Aliases: mma.par
### Keywords: Mediation Analysis Mediator Tests

### ** Examples

 ## No test: 
 library(doParallel)
data("weight_behavior")
#binary predictor
 #binary y
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,15]
 temp.b.b.glm<-mma.par(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),binref=c(1,1),
                    catmed=5,catref=1,predref="M",alpha=0.4,alpha2=0.4,n=2,n2=2)

 temp.b.b.mart<-mma.par(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),binref=c(1,1),
                    catmed=5,catref=1,predref="M",alpha=0.4,alpha2=0.4,nonlinear=TRUE,n=2,n2=5)
 #continuous y
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,1]
 temp.b.c.glm<-mma.par(x,y,pred=pred,mediator=5:12,jointm=list(n=1,j1=7:9), 
                     predref="M",alpha=0.4,alpha2=0.4,n2=20)
 temp.b.c.mart<-mma.par(x,y,pred=pred,mediator=5:12,jointm=list(n=1,j1=7:9), 
                     predref="M",alpha=0.4,alpha2=0.4,
                     n=2,seed=1,nonlinear=TRUE,n2=20)
## End(No test)



