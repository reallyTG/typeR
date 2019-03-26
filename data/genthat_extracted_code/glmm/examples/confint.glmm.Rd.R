library(glmm)


### Name: confint.glmm
### Title: Calculates Asymptotic Confidence Intervals
### Aliases: confint.glmm
### Keywords: generalized linear mixed model

### ** Examples

library(glmm)
data(BoothHobert)
set.seed(123)
## No test: 
mod.mcml1<-glmm(y~0+x1,list(y~0+z1),varcomps.names=c("z1"), data=BoothHobert,
## End(No test)
## No test: 
family.glmm=bernoulli.glmm,m=1000,doPQL=TRUE,cores=2)
## End(No test)
## No test: 
confint(mod.mcml1)
## End(No test)




