library(MIRL)


### Name: threshold
### Title: threshold
### Aliases: threshold

### ** Examples

#This example is a simulation setting in the reference paper.
cor=0.6
prob=0.02
p=10
n=200 #sample size
Sigma=matrix(cor,p,p)#correlation of predictors
diag(Sigma)=1
mu=numeric(p)
set.seed(3)
#C is the complete design matrix without missing
C=mvrnorm(n,mu,Sigma)
#The missing indicator matrix
A<-matrix(rbinom(n*p,size=1,prob),n,p)
A[,c(1,4,6)]=0 #columns without missing
p1=inv.logit(C[,1]+C[,6]-2)
A[,5]=rbinom(n,size=1,p1) #Missing at Random
p2=inv.logit(-C[,1]-0.5*C[,6]-2)
A[,10]=rbinom(n,size=1,p2)
p3=inv.logit(C[,4]-2)
A[,9]=rbinom(n,size=1,p3)
beta=numeric(p)
beta[1:6]=c(0.1,0.2,0.5,-0.3,-.4,-0.5)*5
ct=c(0,beta)
#generating Y
Y=C%*%beta+rnorm(n)
B=C
B[A==1]=NA


## No test: 
best<-threshold(B,Y,q2=p/2,m=3,thr=c(0.75,0.85))
fit<-mirl(B,Y,3,p/2,im=5)
#the column number for selected variables
select=which(fit$Probability>best)
## End(No test)



