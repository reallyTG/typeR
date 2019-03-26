library(SmoothHazard)


### Name: survIC
### Title: Generate survival model objects
### Aliases: survIC survModelIC

### ** Examples

## Not run: 
##D library(lava)
##D library(prodlim)
##D # generate survival model based on exponentially
##D # distributed times
##D m <- survIC(scale.time=1/50, shape.time=0.7)
##D round(sim(m,6),1)
##D 
##D # Estimate the parameters of the Weibull models
##D # based on the uncensored exact event times
##D # and the uncensored illstatus.
##D set.seed(18)
##D d <- sim(m,100,latent=FALSE)
##D d$uncensored.status <- 1
##D f <- shr(Hist(time=list(L,R),event=uncensored.status)~1,
##D          data=d,
##D          conf.int=FALSE)
##D print(f)
## End(Not run)



