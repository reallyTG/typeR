library(secr)


### Name: sim.secr
### Title: Simulate From Fitted secr Model
### Aliases: simulate.secr sim.secr sim.detect simulate
### Keywords: datagen models

### ** Examples


## previously fitted model
simulate(secrdemo.0, nsim = 2)

## Not run: 
##D 
##D ## The following has been superceded by secr.test()
##D 
##D ## this would take a long time...
##D ## adjust ncores for your machine (see ?Parallel)
##D sims <- sim.secr(secrdemo.0, nsim = 99, ncores = 8)
##D deviance(secrdemo.0)
##D devs <- c(deviance(secrdemo.0),sims$deviance)
##D quantile(devs, probs=c(0.95))
##D rank(devs)[1] / length(devs)
##D 
##D ## to assess bias and CI coverage
##D ## adjust ncores for your machine (see ?Parallel)
##D extrfn <- function (object) unlist(predict(object)["D",-1])
##D sims <- sim.secr(secrdemo.0, nsim = 50, hessian = "auto",
##D     extractfn = extrfn, ncores = 8)
##D sims
##D 
##D ## with a larger sample, could get parametric bootstrap CI
##D quantile(sims[,1], c(0.025, 0.975))
##D 
## End(Not run)




