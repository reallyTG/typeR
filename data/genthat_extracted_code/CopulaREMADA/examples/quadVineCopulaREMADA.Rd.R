library(CopulaREMADA)


### Name: quadVineCopulaREMADA
### Title: Maximum likelhood estimation for quadrivariate D-vine copula
###   mixed models for joint meta-analysis and comparison of two diagnostic
###   tests
### Aliases: quadVineCopulaREMADA quadVineCopulaREMADA.norm
###   quadVineCopulaREMADA.beta quadVineCopulaREMADA.norm.beta
### Keywords: maximum likelihood copula distribution

### ** Examples

nq=15
gl=gauss.quad.prob(nq,"uniform")
data(mgrid15)

data(arthritis)
attach(arthritis)

qcond1=qcondcln270
pcond1=pcondcln270
tau2par1=tau2par.cln270

qcond2=qcondfrk
pcond2=pcondfrk
tau2par2=tau2par.frk



# out<-quadVineCopulaREMADA.norm(TP1,FN1,FP1,TN1,TP2,FN2,FP2,TN2,
# gl,mgrid15,qcond1,pcond1,tau2par1,qcond2,pcond2,tau2par2)

detach(arthritis)



