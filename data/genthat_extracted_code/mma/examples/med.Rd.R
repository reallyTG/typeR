library(mma)


### Name: med
### Title: Mediation Analysis with Binary or Continuous Predictor
### Aliases: med
### Keywords: Mediation Analysis

### ** Examples

data("weight_behavior")
##binary x
#binary y
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,15]
 data.bin<-data.org(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),
  binref=c(1,1),catmed=5,catref=1,predref="M",alpha=0.4,alpha2=0.4)
temp1<-med(data=data.bin,n=2,seed=1)
temp2<-med(data=data.bin,n=2,seed=1,nonlinear=TRUE)

## No test: 
 #multivariate predictor
 x=weight_behavior[,c(2:3,5:14)]
 pred=weight_behavior[,4]
 y=weight_behavior[,15]
 data.b.b.2.3<-data.org(x,y,mediator=5:12,jointm=list(n=1,j1=c(5,7,9)),
                        pred=pred,predref="OTHER", alpha=0.4,alpha2=0.4)
 temp1.2<-med(data.b.b.2.3,n=2,seed=1)
 temp2.2<-med(data.b.b.2.3,n=2,seed=1,nonlinear=TRUE)

 #multivariate responses
 x=weight_behavior[,c(2:3,5:14)]
 pred=weight_behavior[,4]
 y=weight_behavior[,c(1,15)]
 data.b.b.2.4<-data.org(x,y,mediator=5:12,jointm=list(n=1,j1=c(5,7,9)),
                        pred=pred,predref="OTHER", alpha=0.4,alpha2=0.4)
 temp1.3<-med(data.b.b.2.4,n=2,seed=1)
 temp2.3<-med(data.b.b.2.4,n=2,seed=1,nonlinear=TRUE)
## End(No test)

#continuous y
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,1]
 data.cont<-data.org(x,y,pred=pred,mediator=5:12,jointm=list(n=1,j1=7:9), 
                     predref="M",alpha=0.4,alpha2=0.4)
 temp3<-med(data=data.cont,n=2,seed=1) 
 temp4<-med(data=data.cont,n=2,seed=1,nonlinear=TRUE) 

##continuous x
#binary y
 x=weight_behavior[,3:14]
 pred=weight_behavior[,2]
 y=weight_behavior[,15]
 data.contx<-data.org(x,y,pred=pred,mediator=4:10,alpha=0.4,alpha2=0.4)
 temp5<-med(data=data.contx,seed=1,n=2)
 temp6<-med(data=data.contx,seed=1,n=2,nonlinear=TRUE,nu=0.05)

#continuous y
x=weight_behavior[,3:14]
y=weight_behavior[,1]
pred=weight_behavior[,2]
data.contx<-data.org(x,y,pred=pred,contmed=c(11:12),binmed=c(6,10),
                     binref=c(1,1),catmed=5,catref=1,
                     alpha=0.4,alpha2=0.4)
## No test: 
temp7<-med(data=data.contx,seed=1,n=2) 
temp8<-med(data=data.contx,seed=1,n=2,nonlinear=TRUE,nu=0.05) 
## End(No test)
##Surv class outcome (survival analysis)
#data(cgd0)       #a dataset in the survival package
cgd1<-cgd0
x=cgd1[,c(4:5,7:12)]
pred=cgd1[,6]
status<-ifelse(is.na(cgd1$etime1),0,1)
y=Surv(cgd1$futime,status)          
#for continuous predictor
data.surv.contx<-data.org(x,y,pred=pred,mediator=1:ncol(x),      
                          alpha=0.5,alpha2=0.5)
temp9.contx<-med(data=data.surv.contx,seed=1,n=2,type="lp")

#close to mart results when use type="lp"
temp9.contx
temp10.contx<-med(data=data.surv.contx,n=2,seed=1,nonlinear=TRUE)  
#results in the linear part unit
temp10.contx

#for binary predictor
## No test: 
x=cgd1[,c(5:12)]
pred=cgd1[,4]
data.surv.binx<-data.org(x,y,pred=pred,mediator=1:ncol(x),   
                    alpha=0.4,alpha2=0.4)
temp9.binx<-med(data=data.surv.binx,seed=1,n=2,type="lp") 
temp9.binx
temp10.binx<-med(data=data.surv.binx,n=2,seed=1,nonlinear=TRUE)  
temp10.binx
## End(No test)



