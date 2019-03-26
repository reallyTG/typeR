library(EMMREML)


### Name: emmremlMultivariate
### Title: Function to fit multivariate Gaussian mixed model with with
###   known covariance structure.
### Aliases: emmremlMultivariate

### ** Examples

l=20
n<-15
m<-40

M<-matrix(rbinom(m*l,2,.2),nrow=l)
rownames(M)<-paste("l",1:nrow(M))
beta1<-rnorm(m)*exp(rbinom(m,5,.2))
beta2<-rnorm(m)*exp(rbinom(m,5,.1))
beta3<- rnorm(m)*exp(rbinom(m,5,.1))+beta2

g1<-M%*%beta1
g2<-M%*%beta2
g3<-M%*%beta3
e1<-sd(g1)*rnorm(l)
e2<-(-e1*2*sd(g2)/sd(g1)+.25*sd(g2)/sd(g1)*rnorm(l))
e3<-1*(e1*.25*sd(g2)/sd(g1)+.25*sd(g2)/sd(g1)*rnorm(l))

y1<-10+g1+e1
y2<--50+g2+e2
y3<--5+g3+e3

Y<-rbind(t(y1),t(y2), t(y3))

colnames(Y)<-rownames(M)
cov(t(Y))
Y[1:3,1:5]

K<-cov(t(M))
K<-K/mean(diag(K))
rownames(K)<-colnames(K)<-rownames(M)
X<-matrix(1,nrow=1,ncol=l)
colnames(X)<-rownames(M)
Z<-diag(l)
rownames(Z)<-colnames(Z)<-rownames(M)
SampleTrain<-sample(rownames(Z),n)
Ztrain<-Z[rownames(Z)%in%SampleTrain,]
Ztest<-Z[!(rownames(Z)%in%SampleTrain),]


##For a quick answer, tolpar is set to 1e-4.  Correct this in practice.
outfunc<-emmremlMultivariate(Y=Y%*%t(Ztrain),
X=X%*%t(Ztrain), Z=t(Ztrain),
K=K,tolpar=1e-4,varBhat=FALSE,
varGhat=FALSE, PEVGhat=FALSE, test=FALSE)

Yhattest<-outfunc$Gpred%*%t(Ztest)

cor(cbind(Ztest%*%Y[1,],Ztest%*%outfunc$Gpred[1,],
Ztest%*%Y[2,],Ztest%*%outfunc$Gpred[2,],Ztest%*%Y[3,],Ztest%*%outfunc$Gpred[3,]))


outfuncRidgeReg<-emmremlMultivariate(Y=Y%*%t(Ztrain),X=X%*%t(Ztrain), Z=t(Ztrain%*%M),
K=diag(m),tolpar=1e-5,varBhat=FALSE,varGhat=FALSE,
PEVGhat=FALSE, test=FALSE)

Gpred2<-outfuncRidgeReg$Gpred%*%t(M)
cor(Ztest%*%Y[1,],Ztest%*%Gpred2[1,])
cor(Ztest%*%Y[2,],Ztest%*%Gpred2[2,])
cor(Ztest%*%Y[3,],Ztest%*%Gpred2[3,])



