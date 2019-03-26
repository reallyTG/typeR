library(CopulaREMADA)


### Name: hybridCopulaREMADA
### Title: Maximum likelhood estimation for hybrid copula mixed models for
###   combining case-control and cohort studies in meta-analysis of
###   diagnostic tests
### Aliases: hybridCopulaREMADA hybridCopulaREMADA.norm
###   hybridCopulaREMADA.beta
### Keywords: maximum likelihood copula distribution

### ** Examples

# simulate the data from N=25 cohort studies
N=25
p=c(0.8,0.7,0.4)
g=c(0.1,0.1,0.05)
taus=c(-0.5,-0.3,-0.0001)
qcondcop12=qcondcop23=qcondcop13=qcondcln90
tau2par12=tau2par23=tau2par13=tau2par.cln90
simdat1=rVineCopulaREMADA.beta(N,p,g,taus,0,0,
qcondcop12,qcondcop13,qcondcop23,tau2par12,tau2par13,tau2par23)
# simulate data from the N=25 case-control studies
tau=0.5
p=p[-3]
g=g[-3]
simdat2=rCopulaREMADA.beta(N,p,g,tau,rcln,tau2par.cln)
# combine the data
TP=c(simdat1$TP,simdat2$TP)
TN=c(simdat1$TN,simdat2$TN)
FP=c(simdat1$FP,simdat2$FP)
FN=c(simdat1$FN,simdat2$FN)
type=rep(c(1,2),each=N)

# fit the hybrid copula mixed model
nq=21
gl=gauss.quad.prob(nq,"uniform")
mgrid1<- meshgrid(gl$n,gl$n,gl$n,nargout=3)
mgrid2<- meshgrid(gl$n,gl$n)

perm=1
qcond=qcondcln
tau2par=tau2par.cln
# est=hybridCopulaREMADA.beta(TP,FN,FP,TN,type,perm,gl,mgrid1,mgrid2,
# qcondcop12,qcondcop13,tau2par12,tau2par13,qcond,tau2par)




