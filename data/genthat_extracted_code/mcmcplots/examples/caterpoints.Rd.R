library(mcmcplots)


### Name: caterpoints
### Title: Points on a "caterplot"
### Aliases: caterpoints
### Keywords: aplot

### ** Examples

## Create fake MCMC output
nc <- 10; nr <- 1000
pnames <- c(paste("alpha[", 1:5, "]", sep=""), paste("gamma[", 1:5, "]", sep=""))
means <- rpois(10, 20)
fakemcmc <- coda::as.mcmc.list(
    lapply(1:3,
           function(i) coda::mcmc(matrix(rnorm(nc*nr, rep(means, each=nr)),
                                         nrow=nr, dimnames=list(NULL,pnames)))))
posterior.medians <- apply(do.call("rbind", fakemcmc), 2, median)


## caterplot plots of the fake MCMC output
par(mfrow=c(2,2))
caterplot(fakemcmc, "alpha", collapse=FALSE)
caterpoints(runif(5, 10, 20), pch="x", col="red")
caterplot(fakemcmc, "alpha", horizontal=FALSE)
caterpoints(runif(5, 10, 20), horizontal=FALSE, pch="x", col="red")
parms <- caterplot(fakemcmc, random=3) # keep the names of plotted parameters
caterpoints(posterior.medians[parms], pch="x", col="red")



