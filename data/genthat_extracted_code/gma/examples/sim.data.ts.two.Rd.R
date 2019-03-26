library(gma)


### Name: sim.data.ts.two
### Title: Generate two-level simulation data
### Aliases: sim.data.ts.two
### Keywords: datagen

### ** Examples

###################################################
# Generate a two-level dataset

# covariance matrix of errors
delta<-0.5
Sigma<-matrix(c(1,2*delta,2*delta,4),2,2)

# model coefficients
A0<-0.5
B0<--1
C0<-0.5

theta<-c(A0,B0,C0)

# number of time points
N<-50
set.seed(2000)
n<-matrix(rpois(N,100),N,1)

# treatment assignment list
set.seed(1000)
Z.list<-list()
for(i in 1:N)
{
  Z.list[[i]]<-matrix(rbinom(n[i,1],size=1,prob=0.5),n[i,1],1)
}

# Lambda
Lambda<-diag(0.5,3)

# VAR(1) model
p<-1

# Delta and W matrices
Delta<-matrix(c(2,delta*sqrt(2*8),delta*sqrt(2*8),8),2,2)
W<-matrix(c(-0.809,0.154,-0.618,-0.5),2,2)

# number of burning samples
nburn<-1000

# set.seed(2000)
# data2<-sim.data.ts.two(Z.list,N,theta=theta,Sigma,W,Delta,p,Lambda,nburn)
###################################################



