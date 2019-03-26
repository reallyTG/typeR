## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----echo=FALSE----------------------------------------------------------
load("gfmR_ex.RData")

## ------------------------------------------------------------------------
library(gfmR)
data(nes96)
head(nes96)

## ------------------------------------------------------------------------
levels(nes96$PID)

## ------------------------------------------------------------------------
attach(nes96)
Response=matrix(0,944,7)
for(i in 1:944){
  if(PID[i]=="strRep"){Response[i,1]=1}
  if(PID[i]=="weakRep"){Response[i,2]=1}
  if(PID[i]=="indRep"){Response[i,3]=1}
  if(PID[i]=="indind"){Response[i,4]=1}
  if(PID[i]=="indDem"){Response[i,5]=1}
  if(PID[i]=="weakDem"){Response[i,6]=1}
  if(PID[i]=="strDem"){Response[i,7]=1}
}
head(Response)

## ------------------------------------------------------------------------
Hmat2=matrix(0,dim(Response)[2],dim(Response)[2])
for(j in 1:6){
  Hmat2[j,j+1]=1
  Hmat2[j+1,j]=1
}
Hmat2[3,5]=1
Hmat2[5,3]=1

## ------------------------------------------------------------------------
ModMat<-lm(popul~age+educ+income,x=TRUE)$x

X=cbind(ModMat[,1],apply(ModMat[,-1],2,scale))

## ------------------------------------------------------------------------
set.seed(1010)
n=dim(Response)[1]
sampID=rep(5,n)
samps=sample(1:n)
mine=floor(n/5)
for(j in 1:4){
  sampID[samps[((j-1)*mine+1):(j*mine)]]=j
}

## ----eval=FALSE----------------------------------------------------------
#  o1<-GFMR.cv(Response,X,lamb = 2^seq(4.2,4.3,.1),H=Hmat2,sampID = sampID,n.cores =5,rho=10^2)

## ------------------------------------------------------------------------
names(o1)
o1$vl
which(o1$vl==max(o1$vl))
o1$lambda[2]

## ---- eval=FALSE---------------------------------------------------------
#  mod<-GroupFusedMulti(Response,X,lambda=2^4.3,H=Hmat2,rho=10^2,iter=50,tol1=10^-4,tol2=10^-4)
#  ## save.image("election_pred.Rdata")

## ------------------------------------------------------------------------
mod

