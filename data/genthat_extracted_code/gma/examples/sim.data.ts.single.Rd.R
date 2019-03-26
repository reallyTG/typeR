library(gma)


### Name: sim.data.ts.single
### Title: Generate single-level simulation data
### Aliases: sim.data.ts.single
### Keywords: datagen

### ** Examples

###################################################
# Generate a single-level dataset

# covariance matrix of errors
delta<-0.5
Sigma<-matrix(c(1,2*delta,2*delta,4),2,2)

# model coefficients
A0<-0.5
B0<--1
C0<-0.5

# number of time points
n<-500

# generate a treatment assignment vector
set.seed(1000)
Z<-matrix(rbinom(n,size=1,prob=0.5),n,1)

# VAR(1) model
p<-1

# Delta and W matrices
Delta<-matrix(c(2,delta*sqrt(2*8),delta*sqrt(2*8),8),2,2)
W<-matrix(c(-0.809,0.154,-0.618,-0.5),2,2)

# number of burning samples
nburn<-1000

set.seed(1000)
data.single<-sim.data.ts.single(n,Z,A0,B0,C0,Sigma,W,Delta,p=p,nburn=nburn)
###################################################



