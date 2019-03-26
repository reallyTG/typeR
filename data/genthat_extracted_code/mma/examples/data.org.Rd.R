library(mma)


### Name: data.org
### Title: Data Organization and Identify Potential Mediators
### Aliases: data.org
### Keywords: Mediator Tests

### ** Examples

data("weight_behavior")
#binary predictor
 #binary y
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,15]
 data.b.b.2.1<-data.org(x,y,mediator=5:12,jointm=list(n=1,j1=c(5,7,9)),
                        pred=pred,predref="M", alpha=0.4,alpha2=0.4)
 summary(data.b.b.2.1)
 #Or you can specify the potential mediators and change the reference 
 #group for binary or categorical mediators. In the following code,
 #potential continuous mediators are columns 8,9,10,12, and 13 of x,
 #binary mediators are columns 7 and 11, and categorical mediator is
 #column 6 of x with 1 to be the reference group for all categorical
 #and binary mediators. 
  data.b.b.2<-data.org(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),
   binref=c(1,1),catmed=5,catref=1,jointm=list(n=1,j1=c(5,7,9)),
   predref="M",alpha=0.4,alpha2=0.4) 
  summary(data.b.b.2)
 #use the mediator argument instead of contmet, binmed and catmed
 
 #multivariate predictor
## No test: 
 x=weight_behavior[,c(2:3,5:14)]
 pred=weight_behavior[,4]
 y=weight_behavior[,15]
 data.b.b.2.3<-data.org(x,y,mediator=5:12,jointm=list(n=1,j1=c(5,7,9)),
                        pred=pred,predref="OTHER", alpha=0.4,alpha2=0.4)
 summary(data.b.b.2.3)

 #multivariate responses
 x=weight_behavior[,c(2:3,5:14)]
 pred=weight_behavior[,4]
 y=weight_behavior[,c(1,15)]
 data.b.b.2.4<-data.org(x,y,mediator=5:12,jointm=list(n=1,j1=c(5,7,9)),
                        pred=pred,predref="OTHER", alpha=0.4,alpha2=0.4)
 summary(data.b.b.2.4)
## End(No test)

 #continuous y
 x=weight_behavior[,c(2,4:14)]
 pred=weight_behavior[,3]
 y=weight_behavior[,1]
 data.b.c.2<-data.org(x,y,pred=pred,mediator=5:12,jointm=list(n=1,j1=7:9), 
   predref="M",alpha=0.4,alpha2=0.4)
 summary(data.b.c.2)
 
#continuous predictor
 #binary y
 x=weight_behavior[,3:14]
 pred=weight_behavior[,2]
 y=weight_behavior[,15]
 data.c.b.2<-data.org(x,y,pred=pred,mediator=5:12,catref=1,
          jointm=list(n=2,j1=7:9,j2=c(5,7)),alpha=0.4,alpha2=0.4)
 summary(data.c.b.2)

#multivariate predictors 
 x=weight_behavior[,c(3:12,14)]
 pred=weight_behavior[,c(2,13)]
 y=weight_behavior[,15]
 data.c.b.2.2<-data.org(x,y,pred=pred,mediator=5:11,catref=1,
          jointm=list(n=2,j1=7:9,j2=c(5,7)),alpha=0.4,alpha2=0.4)
 summary(data.c.b.2.2)
 
 #continuous y
 x=weight_behavior[,3:14]
 pred=weight_behavior[,2]
 y=weight_behavior[,1]
 data.c.c.2<-data.org(x,y,pred=pred,contmed=c(7:9,11:12),binmed=c(6,10),
   binref=c(1,1),catmed=5,catref=1,jointm=list(n=2,j1=7:9,j2=c(5,7)),
   alpha=0.4,alpha2=0.4)
 summary(data.c.c.2)

 #multivariate responses
 x=weight_behavior[,c(2:3,5:14)]
 pred=weight_behavior[,4]
 y=weight_behavior[,c(1,15)]
 data.b.c.2.4<-data.org(x,y,mediator=5:12,jointm=list(n=1,j1=c(5,7,9)),
                        pred=pred,predref="OTHER", alpha=0.4,alpha2=0.4)
 summary(data.b.c.2.4)

# 
 x=weight_behavior[,c(3:12,14)]
 pred=weight_behavior[,c(2,13)]
 y=weight_behavior[,c(1,15)]
 data.c.c.2.2<-data.org(x,y,pred=pred,mediator=5:11,catref=1,
          jointm=list(n=2,j1=7:9,j2=c(5,7)),alpha=0.4,alpha2=0.4)
 summary(data.c.c.2.2)
 
#Surv class outcome (survival analysis)
#data(cgd0)       #a dataset in the survival package
cgd1<-cgd0
x=cgd1[,c(4:5,7:12)]
pred=cgd1[,6]
status<-ifelse(is.na(cgd1$etime1),0,1)
y=Surv(cgd1$futime,status)          
 #for continuous predictor
 #all other variables are considered as potential mediator
 data.surv.contx<-data.org(x,y,pred=pred,mediator=(1:ncol(x)),      
                    alpha=0.5,alpha2=0.5) 
 summary(data.surv.contx)

 #for binary predictor
x=cgd1[,c(5:12)]
pred=cgd1[,4]
 data.surv.binx<-data.org(x,y,pred=pred,mediator=(1:ncol(x)),   
                    alpha=0.4,alpha2=0.4)
 summary(data.surv.binx)



