library(mma)


### Name: boot.med
### Title: Statistical Inference on Mediation Analysis with Continuous or
###   Binary Predictor
### Aliases: boot.med
### Keywords: Mediation Analysis Continuous Predictor

### ** Examples

data("weight_behavior")
##binary x
#binary y
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,15]
 data.bin<-data.org(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),binref=c(1,1),
                    catmed=5,catref=1,predref="M",alpha=0.4,alpha2=0.4)
 temp1<-boot.med(data=data.bin,n=2,n2=4,seed=1)
 temp2<-boot.med(data=data.bin,n=2,n2=4,nu=0.05,seed=1,nonlinear=TRUE)

## No test: 
 #multivariate predictor
 x=weight_behavior[,c(2:3,5:14)]
 pred=weight_behavior[,4]
 y=weight_behavior[,15]
 data.b.b.2.3<-data.org(x,y,mediator=5:12,jointm=list(n=1,j1=c(5,7,9)),
                        pred=pred,predref="OTHER", alpha=0.4,alpha2=0.4)
 temp1.2<-boot.med(data.b.b.2.3,n=2,n2=4,seed=1)
 temp2.2<-boot.med(data.b.b.2.3,n=2,n2=4,nu=0.05,seed=1,nonlinear=TRUE)

 #multivariate responses
 x=weight_behavior[,c(2:3,5:14)]
 pred=weight_behavior[,4]
 y=weight_behavior[,c(1,15)]
 data.b.b.2.4<-data.org(x,y,mediator=5:12,jointm=list(n=1,j1=c(5,7,9)),
                        pred=pred,predref="OTHER", alpha=0.4,alpha2=0.4)
 temp1.3<-boot.med(data.b.b.2.4,n=2,n2=4,seed=1)
 temp2.3<-boot.med(data.b.b.2.4,n=2,n2=4,seed=1,nonlinear=TRUE)

#continuous y
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,1]
 data.cont<-data.org(x,y,pred=pred,mediator=5:12,jointm=list(n=1,j1=7:9), 
                     predref="M",alpha=0.4,alpha2=0.4)
 temp3<-boot.med(data=data.cont,n=2,n2=4,seed=1) 
 temp4<-boot.med(data=data.cont,n=2,n2=4,nu=0.05,seed=1, nonlinear=TRUE)

##continuous x
#binary y
 x=weight_behavior[,3:14]
 pred=weight_behavior[,2]
 y=weight_behavior[,15]
 data.contx<-data.org(x,y,pred=pred,mediator=4:10,alpha=0.4,alpha2=0.4)
 temp5<-boot.med(data=data.contx,seed=1,n=1,n2=2)
 #plot(temp5,vari="exercises",xlim=c(0,30))
 temp6<-boot.med(data=data.contx,seed=1,n=1,refy=0,nonlinear=T,n2=2)

#continuous y
 x=weight_behavior[,3:14]
 y=weight_behavior[,1]
 pred=weight_behavior[,2]
 data.contx<-data.org(x,y,pred=pred,contmed=c(11:12),binmed=c(6,10),
                     binref=c(1,1),catmed=5,catref=1,
                     alpha=0.4,alpha2=0.4)
 temp7<-boot.med(data=data.contx,seed=1,n=1,n2=2) 
 temp8<-boot.med(data=data.contx,nonlinear=T,seed=1,n=1,n2=2)
## End(No test)

##Surv class outcome (survival analysis)
## No test: 
data(cgd0)       #a dataset in the survival package
x=cgd1[,c(4:5,7:12)]
pred=cgd1[,6]
status<-ifelse(is.na(cgd1$etime1),0,1)
y=Surv(cgd1$futime,status)          
#for continuous predictor
data.surv.contx<-data.org(x,y,pred=pred,mediator=1:ncol(x),      
                          alpha=0.5,alpha2=0.5)
temp9.contx<-boot.med(data=data.surv.contx,seed=1,n=1,n2=2, type="lp") 
#summary(temp9.contx)
temp10.contx<-boot.med(data=data.surv.contx,nonlinear=TRUE,seed=1,n=1,n2=2) 
#summary(temp10.contx)
## End(No test)

#for binary predictor
## No test: 
x=cgd1[,c(5:12)]
pred=cgd1[,4]
data.surv.binx<-data.org(x,y,pred=pred,mediator=1:ncol(x),   
                    alpha=0.4,alpha2=0.4)
temp9.binx<-boot.med(data=data.surv.binx,seed=1,n=1,n2=2, type="lp") 
summary(temp9.binx)
temp10.binx<-boot.med(data=data.surv.binx,nonlinear=TRUE,seed=1,n=1,n2=2) 
#summary(temp10.binx)
## End(No test)



