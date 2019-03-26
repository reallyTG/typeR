library(gam)


### Name: step.Gam
### Title: Stepwise model builder for GAM
### Aliases: step.Gam
### Keywords: models regression nonparametric smooth

### ** Examples

data(gam.data)
Gam.object <- gam(y~x+z, data=gam.data)
step.object <-step.Gam(Gam.object, scope=list("x"=~1+x+s(x,4)+s(x,6)+s(x,12),"z"=~1+z+s(z,4)))
## Not run: 
##D # Parallel
##D require(doMC)
##D registerDoMC(cores=2)
##D step.Gam(Gam.object, scope=list("x"=~1+x+s(x,4)+s(x,6)+s(x,12),"z"=~1+z+s(z,4)),parallel=TRUE)
## End(Not run)




