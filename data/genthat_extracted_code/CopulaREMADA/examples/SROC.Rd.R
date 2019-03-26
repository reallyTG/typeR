library(CopulaREMADA)


### Name: SROC
### Title: Summary receiver operating characteristic curves for copula
###   mixed effect models for bivariate meta-analysis of diagnostic test
###   accuracy studies
### Aliases: SROC.norm SROC.beta SROC
### Keywords: graphics

### ** Examples

nq=15
gl=gauss.quad.prob(nq,"uniform")
mgrid<- meshgrid(gl$n,gl$n)

data(telomerase) 
attach(telomerase)
est.n=countermonotonicCopulaREMADA.norm(TP,FN,FP,TN,gl,mgrid)
est.b=countermonotonicCopulaREMADA.beta(TP,FN,FP,TN,gl,mgrid)
SROC(est.b$e,est.n$e,TP,FN,FP,TN)
detach(telomerase)

data(LAG)
attach(LAG)
c180est.b=CopulaREMADA.beta(TP,FN,FP,TN,gl,mgrid,qcondcln180,tau2par.cln180)
SROC.beta(c180est.b$e,dcln180,qcondcln180,tau2par.cln180,TP,FN,FP,TN)
detach(LAG)

data(MRI)
attach(MRI)
c270est.n=CopulaREMADA.norm(TP,FN,FP,TN,gl,mgrid,qcondcln270,tau2par.cln270)
SROC.norm(c270est.n$e,dcln270,qcondcln270,tau2par.cln270,TP,FN,FP,TN)
detach(MRI)




