library(mmabig)


### Name: mma.big
### Title: Multiple Mediation Analysis for mediaiton analysis with big data
###   sets
### Aliases: mma.big
### Keywords: Mediation Analysis Mediator Tests

### ** Examples

#A. binary predictor
set.seed(1)
n=100
pred=rbinom(n,1,0.5)
m1=matrix(rnorm(n*10),n,10)
m2<-matrix(rnorm(n*10,mean=pred,sd=1),n,10)
m3.1=m2[,6:10]
m3=m3.1
m2=m2[,1:5]
m3[m3.1<=0.1]=0
m3[0.1<m3.1 & m3.1<=1]=1
m3[m3.1>1]=2
m3<-apply(m3,2,as.factor)
m<-data.frame(m1,m2,m3)
colnames(m)<-c(paste("m0",1:9,sep=""),paste("m",10:20,sep=""))

lu<--0.5363+0.701*pred+0.801*m[,1]+0.518*m[,2]+1.402*m[,11]+0.773*m[,12]+
    ifelse(m[,16]=="2",2.15,0)+ifelse(m[,16]=="1",0.201,0)

#a. continuous y
y<-rnorm(n,lu,1)

data.e1<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),
                      pred=data.frame(pred),testtype=1)
summary(data.e1,only=TRUE)
data.e1.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred))
summary(data.e1.2,only=TRUE)
med.e1<-med.big(data.e1)
med.e1
med.e1.2<-med.big(data.e1.2)
med.e1.2
mma.e1<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                alpha=1,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
mma.e1.2<-mma.big(data=data.e1.2,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
summary(mma.e1)
summary(mma.e1.2,RE=TRUE)
plot(mma.e1.2,vari="m16")
plot(mma.e1.2,vari="m11")

## No test: 
#b. binary y
y<-rbinom(n,1,exp(lu)/(1+exp(lu)))
data.e2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),
                      pred=data.frame(pred),testtype=1)
summary(data.e2,only=TRUE)
data.e2.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                        alpha1=0.05,alpha2=0.05)
summary(data.e2.2,only=TRUE)
med.e2<-med.big(data.e2)
med.e2
med.e2.2<-med.big(data.e2.2)
med.e2.2
mma.e2<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                alpha=1,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
mma.e2.2<-mma.big(data=data.e2.2,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
summary(mma.e2)
summary(mma.e2.2,RE=TRUE)
plot(mma.e2.2,vari="m16")
plot(mma.e2.2,vari="m11")

#c.time-to-event y
lambda=1/500
survt=-log(runif(n))/lambda/exp(lu)
st=round(runif(n,1,500),0)
time=ifelse(st+survt>600,600,st+survt)-st
cen=ifelse(st+survt>600,0,1)
y=Surv(time,cen)
data.e3<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),testtype=1)
summary(data.e3,only=TRUE)
data.e3.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                        alpha1=0.05,alpha2=0.05)
summary(data.e3.2,only=TRUE)
med.e3<-med.big(data.e3)
med.e3
med.e3.2<-med.big(data.e3.2)
med.e3.2
mma.e3<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),alpha=1,alpha1=0.05,
                alpha2=0.05,n2=3)  #use only the test results.
mma.e3.2<-mma.big(data=data.e3.2,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
summary(mma.e3)
summary(mma.e3.2,RE=TRUE)
plot(mma.e3.2,vari="m16")
plot(mma.e3.2,vari="m11")

#B. continuous predictor
set.seed(1)
n=100
pred=runif(n,-1,1)
m1=matrix(rnorm(n*10),n,10)
m2<-matrix(rnorm(n*5,mean=0.701*pred,sd=1),n,5)
m3.1=matrix(rnorm(n*5,mean=0.518*pred,sd=1),n,5)
m3=m3.1
m3[m3.1<=0]=0
m3[0<m3.1 & m3.1<=1.28]=1
m3[m3.1>1.28]=2
m3<-apply(m3,2,as.factor)
m<-data.frame(m1,m2,m3)
colnames(m)<-c(paste("m0",1:9,sep=""),paste("m",10:20,sep=""))

lu<--0.6852+0.701*pred+0.801*m[,1]+0.518*m[,2]+1.402*m[,11]+0.773*m[,12]+
    ifelse(m[,16]=="2",2.15,0)+ifelse(m[,16]=="1",0.201,0)

#a. continuous y
y<-rnorm(n,lu,1)

data.c.e1<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                        testtype=1,alpha1=0.05,alpha2=0.05)
summary(data.c.e1,only=TRUE)
data.c.e1.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                          alpha1=0.05,alpha2=0.05)
summary(data.c.e1.2,only=TRUE)
med.c.e1<-med.big(data.c.e1)
med.c.e1
med.c.e1.2<-med.big(data.c.e1.2)
med.c.e1.2
mma.c.e1<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),alpha1=0.05,
                  alpha2=0.05,n2=3)
mma.c.e1.2<-mma.big(data=data.c.e1.2,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
summary(mma.c.e1)
summary(mma.c.e1.2,RE=TRUE)
plot(mma.c.e1,vari="m11")
plot(mma.c.e1,vari="m16")

#b. binary y
y<-rbinom(n,1,exp(lu)/(1+exp(lu)))
data.c.e2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                        testtype=1,alpha1=0.05,alpha2=0.05)
summary(data.c.e2,only=TRUE)
data.c.e2.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                          alpha1=0.05,alpha2=0.05)
summary(data.c.e2.2,only=TRUE)
med.c.e2<-med.big(data.c.e2)
med.c.e2
med.c.e2.2<-med.big(data.c.e2.2)
med.c.e2.2
mma.c.e2<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),alpha1=0.05,
                  alpha2=0.05,n2=3)
mma.c.e2.2<-mma.big(data=data.c.e2.2,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
summary(mma.c.e2)
summary(mma.c.e2.2,RE=TRUE)
plot(mma.c.e2,vari="m11")
plot(mma.c.e2,vari="m16")

#c.time-to-event y
lambda=1/500
survt=-log(runif(n))/lambda/exp(lu)
st=round(runif(n,1,500),0)
time=ifelse(st+survt>600,600,st+survt)-st
cen=ifelse(st+survt>600,0,1)
y=Surv(time,cen)
data.c.e3<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),testtype=1)
summary(data.c.e3,only=TRUE)
data.c.e3.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                          alpha1=0.05,alpha2=0.05)
summary(data.c.e3.2,only=TRUE)
med.c.e3<-med.big(data.c.e3)
med.c.e3
med.c.e3.2<-med.big(data.c.e3.2)
med.c.e3.2
mma.c.e3<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),alpha1=0.05,
                  alpha2=0.05,n2=3)
mma.c.e3.2<-mma.big(data=data.c.e3.2,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
summary(mma.c.e3)
summary(mma.c.e3.2,RE=TRUE,quant=FALSE)
plot(mma.c.e3,vari="m11")
plot(mma.c.e3,vari="m16")


#C. multiple predictors
#A) categorical predictor
set.seed(1)
n=100
pred=rmultinom(100,1,c(0.5, 0.3, 0.2))
pred=pred[1,]*0+pred[2,]*1+pred[3,]*2
m1=matrix(rnorm(n*10),n,10)
m2<-matrix(rnorm(n*10,mean=pred,sd=1),n,10)
m3.1=m2[,6:10]
m2=m2[,1:5]
m3=m3.1
m3[m3.1<=0.1]=0
m3[0.1<m3.1 & m3.1<=1]=1
m3[m3.1>1]=2
m3<-apply(m3,2,as.factor)
m<-data.frame(m1,m2,m3)
colnames(m)<-c(paste("m0",1:9,sep=""),paste("m",10:20,sep=""))
pred<-as.factor(pred)

lu<--0.5363+ifelse(pred=="1",0.3,0)+ifelse(pred=="2",0.7,0)+0.801*m[,1]+0.518*m[,2]+
    1.402*m[,11]+0.773*m[,12]+ifelse(m[,16]=="2",2.15,0)+ifelse(m[,16]=="1",0.201,0)

#a. continuous y
y<-rnorm(n,lu,1)

data.m.e1<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),testtype=1)
summary(data.m.e1,only=TRUE)
data.m.e1.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred))
summary(data.m.e1.2,only=TRUE)
med.m.e1<-med.big(data.m.e1)
med.m.e1
med.m.e1.2<-med.big(data.m.e1.2)
med.m.e1.2
mma.m.e1<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),alpha=1,
                  alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
mma.m.e1.2<-mma.big(data=data.m.e1.2,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
summary(mma.m.e1)
summary(mma.m.e1.2,RE=TRUE)
summary(mma.m.e1.2,use.ball=TRUE)
plot(mma.m.e1,vari="m11")
plot(mma.m.e1,vari="m16")

#b. binary y
y<-rbinom(n,1,exp(lu)/(1+exp(lu)))
data.m.e2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),testtype=1)
summary(data.m.e2,only=TRUE)
data.m.e2.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                          alpha1=0.05,alpha2=0.05)
summary(data.m.e2.2,only=TRUE)
med.m.e2<-med.big(data.m.e2)
med.m.e2
med.m.e2.2<-med.big(data.m.e2.2)
med.m.e2.2
mma.m.e2<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),alpha=1,
                  alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
mma.m.e2.2<-mma.big(data=data.m.e2.2,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
summary(mma.m.e2)
summary(mma.m.e2.2,RE=TRUE)
plot(mma.m.e2,vari="m11")
plot(mma.m.e2,vari="m16")

#c.time-to-event y
lambda=1/500
survt=-log(runif(n))/lambda/exp(lu)
st=round(runif(n,1,500),0)
time=ifelse(st+survt>600,600,st+survt)-st
cen=ifelse(st+survt>600,0,1)
y=Surv(time,cen)
data.m.e3<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),testtype=1)
summary(data.m.e3,only=TRUE)
data.m.e3.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                          alpha1=0.05,alpha2=0.05)
summary(data.m.e3.2,only=TRUE)
med.m.e3<-med.big(data.m.e3)
med.m.e3
med.m.e3.2<-med.big(data.m.e3.2)
med.m.e3.2
mma.m.e3<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),alpha=1,
                  alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
mma.m.e3.2<-mma.big(data=data.m.e3.2,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
summary(mma.m.e3)
summary(mma.m.e3.2,RE=TRUE)
plot(mma.m.e3,vari="m11")
plot(mma.m.e3,vari="m16")

#B) continuous predictor
set.seed(1)
n=100
pred=cbind(runif(n,-1,1),rnorm(n))
m1=matrix(rnorm(n*10),n,10)
m2<-matrix(rnorm(n*5,mean=0.3*pred[,1]+0.4*pred[,2],sd=1),n,5)
m3.1=matrix(rnorm(n*5,mean=0.7*pred[,1]+0.8*pred[,2],sd=1),n,5)
m3=m3.1
m3[m3.1<=0]=0
m3[0<m3.1 & m3.1<=1.28]=1
m3[m3.1>1.28]=2
m3<-apply(m3,2,as.factor)
m<-data.frame(m1,m2,m3)
colnames(m)<-c(paste("m0",1:9,sep=""),paste("m",10:20,sep=""))
colnames(pred)=c("x1","x2")

lu<--0.6852+0.3*pred[,1]+0.7*pred[,2]+0.801*m[,1]+0.518*m[,2]+1.402*m[,11]+0.773*m[,12]+
     ifelse(m[,16]=="2",2.15,0)+ifelse(m[,16]=="1",0.201,0)

#a. continuous y
y<-rnorm(n,lu,1)

data.m.c.e1<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                          testtype=1,alpha1=0.05,alpha2=0.05)
summary(data.m.c.e1,only=TRUE)
data.m.c.e1.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                            alpha1=0.05,alpha2=0.05)
summary(data.m.c.e1.2,only=TRUE)
med.m.c.e1<-med.big(data.m.c.e1)
med.m.c.e1
med.m.c.e1.2<-med.big(data.m.c.e1.2)
med.m.c.e1.2
mma.m.c.e1<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                    alpha1=0.05,alpha2=0.05,n2=3)
mma.m.c.e1.2<-mma.big(data=data.c.e1.2,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
summary(mma.m.c.e1)
summary(mma.m.c.e1.2,RE=TRUE)
plot(mma.m.c.e1,vari="m11")
plot(mma.m.c.e1,vari="m16")

#b. binary y
y<-rbinom(n,1,exp(lu)/(1+exp(lu)))
data.m.c.e2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                          testtype=1,alpha1=0.05,alpha2=0.05)
summary(data.m.c.e2,only=TRUE)
data.m.c.e2.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                            alpha1=0.05,alpha2=0.05)
summary(data.m.c.e2.2,only=TRUE)
med.m.c.e2<-med.big(data.m.c.e2)
med.m.c.e2
med.m.c.e2.2<-med.big(data.m.c.e2.2)
med.m.c.e2.2
pred.new=cbind(runif(n,-1,1),rnorm(n))
colnames(pred.new)=c("x1","x2")
print(med.m.c.e2.2,pred.new=pred.new)
mma.m.c.e2<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),alpha1=0.05,
                    alpha2=0.05,n2=3)
mma.m.c.e2.2<-mma.big(data=data.m.c.e2.2,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
summary(mma.m.c.e2)
summary(mma.m.c.e2.2,RE=TRUE)
plot(mma.m.c.e2,vari="m11")
plot(mma.m.c.e2,vari="m16")


#c.time-to-event y
lambda=1/500
survt=-log(runif(n))/lambda/exp(lu)
st=round(runif(n,1,500),0)
time=ifelse(st+survt>600,600,st+survt)-st
cen=ifelse(st+survt>600,0,1)
y=Surv(time,cen)
data.m.c.e3<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),testtype=1)
summary(data.m.c.e3,only=TRUE)
data.m.c.e3.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                            alpha1=0.05,alpha2=0.05)
summary(data.m.c.e3.2,only=TRUE)
med.m.c.e3<-med.big(data.m.c.e3)
med.m.c.e3
med.m.c.e3.2<-med.big(data.m.c.e3.2)
med.m.c.e3.2
mma.m.c.e3<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),alpha1=0.05,
                    alpha2=0.05,n2=3)
mma.m.c.e3.2<-mma.big(data=data.m.c.e3.2,alpha1=0.05,alpha2=0.05,n2=3)  #use only the test results.
summary(mma.m.c.e3)
summary(mma.m.c.e3.2,RE=TRUE)
plot(mma.m.c.e3,vari="m11")
plot(mma.m.c.e3,vari="m16")


#d. multivariate y
y<-cbind(rnorm(n,lu,1),rbinom(n,1,exp(lu)/(1+exp(lu))))
colnames(y)=c("y1","y2")
data.m.m.c.e2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                            testtype=1,alpha1=0.05,alpha2=0.05)
summary(data.m.m.c.e2,only=TRUE)
data.m.m.c.e2.2<-data.org.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),
                              alpha1=0.05,alpha2=0.05)
summary(data.m.m.c.e2.2,only=TRUE)
med.m.m.c.e2<-med.big(data.m.m.c.e2)
med.m.m.c.e2
med.m.m.c.e2.2<-med.big(data.m.m.c.e2.2)
med.m.m.c.e2.2
pred.new=cbind(runif(n,-1,1),rnorm(n))
colnames(pred.new)=c("x1","x2")
print(med.m.m.c.e2.2,pred.new=pred.new)
mma.m.m.c.e2<-mma.big(x=m,y=data.frame(y),mediator=1:ncol(m),pred=data.frame(pred),alpha1=0.05,
                      alpha2=0.05,n2=3)
mma.m.m.c.e2.2<-mma.big(data=data.m.m.c.e2.2,alpha1=0.05,alpha2=0.05,n2=3)  
summary(mma.m.m.c.e2)
summary(mma.m.m.c.e2.2,RE=TRUE)
plot(mma.m.m.c.e2,vari="m11")
plot(mma.m.m.c.e2,vari="m16")
mma.m.m.c.e2
mma.m.m.c.e2.2
## End(No test)



