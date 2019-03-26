library(ctmcd)


### Name: gmGS
### Title: Gibbs Sampler
### Aliases: gmGS

### ** Examples

data(tm_abs)

## Example prior parametrization (absorbing default state)
pr=list()
pr[[1]]=matrix(1,8,8)
pr[[1]][8,]=0

pr[[2]]=c(rep(5,7),Inf)

## Derive Gibbs sampling generator matrix estimate
## Not run: 
##D gmgs=gmGS(tmabs=tm_abs,te=1,sampl_method="Unif",prior=pr,burnin=10,niter=100,verbose=TRUE)
##D gmgs
## End(Not run)




