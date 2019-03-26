library(c060)


### Name: Plot.peperr.curves
### Title: Plot method for prediction error curves of a peperr object
### Aliases: Plot.peperr.curves
### Keywords: models regression survival

### ** Examples

## Not run: 
##D 
##D # example from glmnet package
##D set.seed(10101)
##D library(glmnet)
##D library(survival)
##D library(peperr)
##D 
##D N=1000;p=30
##D nzc=p/3
##D x=matrix(rnorm(N*p),N,p)
##D beta=rnorm(nzc)
##D fx=x[,seq(nzc)]##D 
##D hx=exp(fx)
##D ty=rexp(N,hx)
##D tcens=rbinom(n=N,prob=.3,size=1)# censoring indicator
##D y=Surv(ty,1-tcens)
##D 
##D peperr.object <- peperr(response=y, x=x, 
##D                         fit.fun=fit.glmnet, args.fit=list(family="cox"), 
##D                         complexity=complexity.glmnet,  
##D                         args.complexity=list(family="cox",nfolds=10),
##D                         indices=resample.indices(n=N, method="sub632", sample.n=10))
##D 
##D # pointwise bootstrap quantiles and all error types
##D Plot.peperr.curves(peperr.object, allErrors=TRUE)
##D 
##D # individual bootstrap runs and selected error types
##D Plot.peperr.curves(peperr.object, allErrors=FALSE, bootRuns=TRUE)
## End(Not run)



