library(glmm)


### Name: logLik.glmm
### Title: Monte Carlo Log Likelihood
### Aliases: logLik.glmm
### Keywords: generalized linear mixed model

### ** Examples

library(glmm)
set.seed(1234)
data(salamander)

m<-1000
## No test: 
sal<-glmm(Mate~0+Cross,random=list(~0+Female,~0+Male),varcomps.names=c("F","M"),
## End(No test)
## No test: 
data=salamander,family.glmm=bernoulli.glmm,m=m,debug=TRUE,cores=2)
## End(No test)
## No test: 
logLik(sal)
## End(No test)





