library(mma)


### Name: mma
### Title: Multiple Mediation Analysis
### Aliases: mma
### Keywords: Mediation Analysis Mediator Tests

### ** Examples

data("weight_behavior")
#binary predictor
 #binary y
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,15]
 temp.b.b.glm<-mma(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),binref=c(1,1),
                    catmed=5,catref=1,predref="M",alpha=0.4,alpha2=0.4,n=2,n2=2)
 ## No test: 
 temp.b.b.mart<-mma(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),binref=c(1,1),
                    catmed=5,catref=1,predref="M",alpha=0.4,alpha2=0.4,nonlinear=TRUE,n=2,n2=5)
 #continuous y
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,1]
 temp.b.c.glm<-mma(x,y,pred=pred,mediator=5:12,jointm=list(n=1,j1=7:9), 
                     predref="M",alpha=0.4,alpha2=0.4,n2=20)
 temp.b.c.mart<-mma(x,y,pred=pred,mediator=5:12,jointm=list(n=1,j1=7:9), 
                     predref="M",alpha=0.4,alpha2=0.4,
                     n=2,seed=1,nonlinear=TRUE,n2=20)
## End(No test)

## No test: 
##Surv class outcome (survival analysis)
data(cgd0)       #a dataset in the survival package
x=cgd1[,c(4:5,7:12)]
pred=cgd1[,6]
status<-ifelse(is.na(cgd1$etime1),0,1)
y=Surv(cgd1$futime,status)          
#for continuous predictor
temp.cox.contx<-mma(x,y,pred=pred,mediator=1:ncol(x),      
                    alpha=0.5,alpha2=0.5,seed=1,n=1,n2=2,type="lp") 
summary(temp.cox.contx)
temp.surv.mart.contx<-mma(x,y,pred=pred,mediator=1:ncol(x),      
                    alpha=0.5,alpha2=0.5,nonlinear=TRUE,seed=1,n2=2) 
summary(temp.surv.mart.contx,ball.use=F)
plot(temp.surv.mart.contx,vari="steroids")
plot(temp.cox.contx,vari="steroids")

#for binary predictor
x=cgd1[,c(5:12)]
pred=cgd1[,4]
temp.cox.binx<-mma(x,y,pred=pred,mediator=1:ncol(x),   
                    alpha=0.4,alpha2=0.4,seed=1,n=1,n2=2,type="lp") 
summary(temp.cox.binx)
temp.surv.mart.binx<-mma(x,y,pred=pred,mediator=1:ncol(x),   
                    alpha=0.4,alpha2=0.4,nonlinear=TRUE,n=1,n2=2) 
summary(temp.surv.mart.binx, RE=T,ball.use=F)
plot(temp.surv.mart.binx,vari="hos.cat")
plot(temp.cox.binx,vari="hos.cat")
## End(No test)



