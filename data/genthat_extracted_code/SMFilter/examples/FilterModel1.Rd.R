library(SMFilter)


### Name: FilterModel1
### Title: Filtering algorithm for the type one model.
### Aliases: FilterModel1
### Keywords: filtering

### ** Examples


iT = 50
ip = 2
ir = 1
iqx = 4
iqz=0
ik = 0
Omega = diag(ip)*.1

if(iqx==0) mX=NULL else mX = matrix(rnorm(iT*iqx),iT, iqx)
if(iqz==0) mZ=NULL else mZ = matrix(rnorm(iT*iqz),iT, iqz)
if(ik==0) mY=NULL else mY = matrix(0, ik, ip)

alpha_0 = matrix(c(runif_sm(num=1,ip=ip,ir=ir)), ip, ir)
beta = matrix(c(runif_sm(num=1,ip=ip*ik+iqx,ir=ir)), ip*ik+iqx, ir)
mB=NULL
vD = 100

ret = SimModel1(iT=iT, mX=mX, mZ=mZ, mY=mY, alpha_0=alpha_0, beta=beta, mB=mB, vD=vD, Omega=Omega)
mYY=as.matrix(ret$dData[,1:ip])
fil = FilterModel1(mY=mYY, mX=mX, mZ=mZ, beta=beta, mB=mB, Omega=Omega, vD=vD, U0=alpha_0)




