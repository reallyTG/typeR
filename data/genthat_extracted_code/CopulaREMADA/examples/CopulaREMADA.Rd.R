library(CopulaREMADA)


### Name: CopulaREMADA
### Title: Maximum likelhood estimation for copula mixed models for
###   diagnostic test accurracy studies
### Aliases: CopulaREMADA CopulaREMADA.norm CopulaREMADA.beta
###   countermonotonicCopulaREMADA countermonotonicCopulaREMADA.norm
###   countermonotonicCopulaREMADA.beta
### Keywords: maximum likelihood copula distribution

### ** Examples

nq=15
gl=gauss.quad.prob(nq,"uniform")
mgrid<- meshgrid(gl$n,gl$n)

data(LAG)
attach(LAG)
c270est.b=CopulaREMADA.beta(TP,FN,FP,TN,gl,mgrid,qcondcln270,tau2par.cln270)
detach(LAG)

data(MRI)
attach(MRI)
c270est.n=CopulaREMADA.norm(TP,FN,FP,TN,gl,mgrid,qcondcln270,tau2par.cln270)
detach(MRI)

data(CT)
attach(CT)
est.n=countermonotonicCopulaREMADA.norm(TP,FN,FP,TN,gl,mgrid)
est.b=countermonotonicCopulaREMADA.beta(TP,FN,FP,TN,gl,mgrid)
detach(CT)



