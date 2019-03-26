library(CopulaREMADA)


### Name: rCopulaREMADA
### Title: Simulation from copula mixed models for diagnostic test
###   accuaracy studies
### Aliases: rCopulaREMADA rCopulaREMADA.norm rCopulaREMADA.beta
### Keywords: simulation

### ** Examples

nq=15
gl=gauss.quad.prob(nq,"uniform")
mgrid<- meshgrid(gl$n,gl$n)

N=20
tau=-0.5
p=c(0.7,0.9)
g=c(0.2,0.1)
simDat=rCopulaREMADA.beta(N,p,g,tau,rcln270,tau2par.cln270)
TP=simDat$TP
TN=simDat$TN
FP=simDat$FP
FN=simDat$FN
c270est.b=CopulaREMADA.beta(TP,FN,FP,TN,gl,mgrid,qcondcln270,tau2par.cln270)

si=c(2,1)
tau=0.5
simDat=rCopulaREMADA.norm(N,p,si,tau,rcln,tau2par.cln)
TP=simDat$TP
TN=simDat$TN
FP=simDat$FP
FN=simDat$FN
cest.n=CopulaREMADA.norm(TP,FN,FP,TN,gl,mgrid,qcondcln,tau2par.cln)



