library(CopulaREMADA)


### Name: VineCopulaREMADA
### Title: Maximum likelhood estimation for (truncated) vine copula mixed
###   models for diagnostic test accurracy studies accounting for disease
###   prevalence and non-evaluable outcomes
### Aliases: VineCopulaREMADA VineCopulaREMADA.norm VineCopulaREMADA.beta
###   tVineCopulaREMADA tVineCopulaREMADA.norm tVineCopulaREMADA.beta
### Keywords: maximum likelihood copula distribution

### ** Examples

nq=15
gl=gauss.quad.prob(nq,"uniform")
mgrid=meshgrid(gl$n,gl$n,gl$n,nargout=3)

data(OGT)
attach(OGT)
# out=tVineCopulaREMADA.norm(TP,FN,FP,TN,1,gl,mgrid,
# qcondbvn,qcondbvn,tau2par.bvn,tau2par.bvn)
detach(OGT)
############################################
# In the precence of non-evaluable results #
data(coronary)
attach(coronary)
# out=tVineCopulaREMADA.norm(TP,FN,FP,TN,2,gl,mgrid,
# qcondbvn,qcondbvn,tau2par.bvn,tau2par.bvn,NEP,NEN)
detach(coronary)



