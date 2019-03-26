library(CopulaREMADA)


### Name: vuong
### Title: Vuong's test for the comparison of non-nested copula mixed
###   models for diagnostic test accuaracy studies
### Aliases: vuong countermonotonicity.vuong vuong.norm vuong.beta
### Keywords: maximum likelihood

### ** Examples

nq=15
gl=gauss.quad.prob(nq,"uniform")
mgrid<- meshgrid(gl$n,gl$n)

data(MRI)
attach(MRI)
c270est.b=CopulaREMADA.beta(TP,FN,FP,TN,gl,mgrid,qcondcln270,tau2par.cln270)
nest.n=CopulaREMADA.norm(TP,FN,FP,TN,gl,mgrid,qcondbvn,tau2par.bvn)
c90est.n=CopulaREMADA.norm(TP,FN,FP,TN,gl,mgrid,qcondcln90,tau2par.cln90)
vuong.beta(qcondcln270,tau2par.cln270,nest.n$e,c270est.b$e,TP,FN,FP,TN,gl,mgrid)
vuong.norm(qcondcln90,tau2par.cln90,nest.n$e,c90est.n$e,TP,FN,FP,TN,gl,mgrid)
detach(MRI)

data(CT)
attach(CT)
est.n=countermonotonicCopulaREMADA.norm(TP,FN,FP,TN,gl,mgrid)
est.b=countermonotonicCopulaREMADA.beta(TP,FN,FP,TN,gl,mgrid)
countermonotonicity.vuong(est.n$e,est.b$e,TP,FN,FP,TN,gl,mgrid)
detach(CT)



