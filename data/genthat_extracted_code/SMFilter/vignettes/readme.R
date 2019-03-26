## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(ggplot2)
library(SMFilter)

## ----install1, eval=F----------------------------------------------------
#  install.packages("SMFilter")

## ----install2, eval=F----------------------------------------------------
#  devtools::install_github("yukai-yang/SMFilter")

## ----attach--------------------------------------------------------------
library(SMFilter)

## ----version-------------------------------------------------------------
version()

## ----contents------------------------------------------------------------
ls( grep("SMFilter", search()) ) 

## ----type1, eval=F-------------------------------------------------------
#  ?SimModel1

## ----init11--------------------------------------------------------------
set.seed(1) # control the seed
iT = 100 # sample size
ip = 2 # dimension of the dependent variable
ir = 1 # rank number
iqx = 3 # dimension of the independent variable x_t
iqz=0 # dimension of the independent variable z_t
ik = 0 # lag length
method='max_3' # the optimization methond to use, for details, see FilterModel1
Omega = diag(ip)*.1 # covariance of the errors
vD = 50 # diagonal of the D matrix

## ----init12--------------------------------------------------------------
if(iqx==0) mX=NULL else mX = matrix(rnorm(iT*iqx),iT, iqx)
if(iqz==0) mZ=NULL else mZ = matrix(rnorm(iT*iqz),iT, iqz)
if(ik==0) mY=NULL else mY = matrix(0, ik, ip)
alpha_0 = matrix(c(runif_sm(num=1,ip=ip,ir=ir)), ip, ir)
beta = matrix(c(runif_sm(num=1,ip=ip*ik+iqx,ir=ir)), ip*ik+iqx, ir)
if(ip*ik+iqz==0) mB=NULL else mB = matrix(c(runif_sm(num=1,ip=(ip*ik+iqz)*ip,ir=1)), ip, ip*ik+iqz)

## ----sim1----------------------------------------------------------------
ret = SimModel1(iT=iT, mX=mX, mZ=mZ, mY=mY, alpha_0=alpha_0, beta=beta, mB=mB, vD=vD, Omega=Omega)

## ----dat1----------------------------------------------------------------
matplot(ret$dData[,1:ip], type="l", ylab="simulated data")

## ----filter1-------------------------------------------------------------
fil = FilterModel1(mY=as.matrix(ret$dData[,1:ip]), mX=mX, mZ=mZ, beta=beta, mB=mB, Omega=Omega, vD=vD, U0=alpha_0, method=method)

## ----dist1, echo=F-------------------------------------------------------
fil = fil[2:(iT+1),,,drop=F] # remove the initial value
ra = ret$aAlpha # get the true ones
# define a function to compute the distances
ftmp <- function(ix){
  mx1 = matrix(fil[ix,,],ip,ir)
  mx2 = matrix(ra[ix,,],ip,ir)
  return(FDist2(mx1,mx2))
}
# plot the distances
ggplot() + geom_point(aes(x=1:iT,y=sapply(1:iT,ftmp)/4/ir)) +
  ylim(0, 1) + labs(x=paste0("t= 1, ...,",iT), y="normalized d( \u03b1, U )")

## ----type2, eval=F-------------------------------------------------------
#  ?SimModel2

## ----init21--------------------------------------------------------------
iT = 100
ip = 2
ir = 1
iqx = 4
iqz=0
ik = 0
Omega = diag(ip)*.1
vD = 50

## ----init22--------------------------------------------------------------
if(iqx==0) mX=NULL else mX = matrix(rnorm(iT*iqx),iT, iqx)
if(iqz==0) mZ=NULL else mZ = matrix(rnorm(iT*iqz),iT, iqz)
if(ik==0) mY=NULL else mY = matrix(0, ik, ip)
alpha = matrix(c(runif_sm(num=1,ip=ip,ir=ir)), ip, ir)
beta_0 = matrix(c(runif_sm(num=1,ip=ip*ik+iqx,ir=ir)), ip*ik+iqx, ir)
if(ip*ik+iqz==0) mB=NULL else mB = matrix(c(runif_sm(num=1,ip=(ip*ik+iqz)*ip,ir=1)), ip, ip*ik+iqz)

## ----sim2----------------------------------------------------------------
ret = SimModel2(iT=iT, mX=mX, mZ=mZ, mY=mY, alpha=alpha, beta_0=beta_0, mB=mB, vD=vD)

## ----dat2----------------------------------------------------------------
matplot(ret$dData[,1:ip], type="l",ylab="simulated data")

## ----filter2-------------------------------------------------------------
fil = FilterModel2(mY=as.matrix(ret$dData[,1:ip]), mX=mX, mZ=mZ, alpha=alpha, mB=mB, Omega=Omega, vD=vD, U0=beta_0, method=method)

## ----dist, echo=F--------------------------------------------------------
fil = fil[2:(iT+1),,,drop=F] # remove the initial value
ra = ret$aBeta
ftmp <- function(ix){
  mx1 = matrix(fil[ix,,],iqx,ir)
  mx2 = matrix(ra[ix,,],iqx,ir)
  return(FDist2(mx1,mx2))
}
# plot the distances
ggplot() + geom_point(aes(x=1:iT,y=sapply(1:iT,ftmp)/4/ir)) +
  ylim(0, 1) + labs(x=paste0("t= 1, ...,",iT), y="normalized d( \u03b2, U )")

