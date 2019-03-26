library(SMFilter)


### Name: SimModel1
### Title: Simulate from the type one state-space Model on Stiefel
###   manifold.
### Aliases: SimModel1
### Keywords: simulation

### ** Examples


iT = 50 # sample size
ip = 2 # dimension of the dependent variable
ir = 1 # rank number
iqx=2 # number of variables in X
iqz=2 # number of variables in Z
ik = 1 # lag length

if(iqx==0) mX=NULL else mX = matrix(rnorm(iT*iqx),iT, iqx)
if(iqz==0) mZ=NULL else mZ = matrix(rnorm(iT*iqz),iT, iqz)
if(ik==0) mY=NULL else mY = matrix(0, ik, ip)

alpha_0 = matrix(c(runif_sm(num=1,ip=ip,ir=ir)), ip, ir)
beta = matrix(c(runif_sm(num=1,ip=ip*ik+iqx,ir=ir)), ip*ik+iqx, ir)
if(ip*ik+iqz==0) mB=NULL else mB = matrix(c(runif_sm(num=1,ip=(ip*ik+iqz)*ip,ir=1)), ip, ip*ik+iqz)
vD = 50

ret = SimModel1(iT=iT, mX=mX, mZ=mZ, mY=mY, alpha_0=alpha_0, beta=beta, mB=mB, vD=vD)




