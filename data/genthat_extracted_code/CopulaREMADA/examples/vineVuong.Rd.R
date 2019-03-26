library(CopulaREMADA)


### Name: vine.vuong
### Title: Vuong's test for the comparison of non-nested vine copula mixed
###   models for diagnostic test accuaracy studies
### Aliases: vine.vuong vine.vuong.norm vine.vuong.beta tvine.vuong.norm
###   tvine.vuong.beta tvine2.vuong.norm tvine2.vuong.beta
### Keywords: maximum likelihood

### ** Examples

nq=15
gl=gauss.quad.prob(nq,"uniform")
mgrid=meshgrid(gl$n,gl$n,gl$n,nargout=3)

data(betaDG)
attach(betaDG)
#nest.n2=VineCopulaREMADA.norm(TP,FN,FP,TN,2,gl,mgrid,
#qcondbvn,qcondbvn,qcondbvn,
#tau2par.bvn,tau2par.bvn,tau2par.bvn)
nest.n2.est= #nest.n2$e
c(0.87186926,  0.13696066,  0.70614956,  0.69152133,  
0.51780203,  0.70883558, -0.41354870,0.07701287, -0.12111253)
#c090est.b2=VineCopulaREMADA.beta(TP,FN,FP,TN,2,gl,mgrid,
#qcondcln90,qcondcln,qcondcln90,tau2par.cln90,tau2par.cln,tau2par.cln90)
c090est.b2.est= #c090est.b2$e
c(0.85528463,  0.14667571,  0.68321231,  0.04897466,
0.02776290,  0.08561436, -0.34639172, 0.04621924, -0.21627977)
c090vuong.b2=vine.vuong.beta(qcondcln90,qcondcln,qcondcln90,
tau2par.cln90,tau2par.cln,tau2par.cln90,
nest.n2.est,c090est.b2.est,TP,FN,FP,TN,2,gl,mgrid)
c090vuong.b2
detach(betaDG)



