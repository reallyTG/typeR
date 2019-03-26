library(glmm)


### Name: mcvcov
### Title: Monte Carlo Variance Covariance Matrix
### Aliases: mcvcov
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
data=salamander,family.glmm=bernoulli.glmm,m=m,debug=TRUE,doPQL=FALSE,cores=2)
## End(No test)
## No test: 
mcvcov(sal)
## End(No test)





