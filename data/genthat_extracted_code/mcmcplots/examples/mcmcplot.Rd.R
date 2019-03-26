library(mcmcplots)


### Name: mcmcplot
### Title: Diagnostics Plots for MCMC in HTML format
### Aliases: mcmcplot
### Keywords: hplot

### ** Examples

## Not run: 
##D ## Create fake MCMC output
##D nc <- 10; nr <- 1000
##D pnames <- c(paste("alpha[", 1:5, "]", sep=""), paste("gamma[", 1:5, "]", sep=""))
##D means <- rpois(10, 20)
##D fakemcmc <- coda::as.mcmc.list(
##D     lapply(1:3,
##D            function(i) coda::mcmc(matrix(rnorm(nc*nr, rep(means,each=nr)),
##D                                          nrow=nr, dimnames=list(NULL,pnames)))))
##D 
##D ## Use mcmcplot to plot
##D ## the fake MCMC output
##D mcmcplot(fakemcmc)
##D mcmcplot(fakemcmc, greek=TRUE)
##D mcmcplot(fakemcmc, xlim=range(fakemcmc)) # put the densities on the same scale
##D mcmcplot(fakemcmc, "gamma")
##D mcmcplot(fakemcmc, regex="alpha\\[[12]", style="plain")
##D mcmcplot(fakemcmc, "gamma", regex="alpha\\[[12]")
##D mcmcplot(fakemcmc, random=2)
##D mcmcplot(fakemcmc, random=c(2, 3))
##D 
##D ## What happens with NULL varnames?
##D coda::varnames(fakemcmc) <- NULL
##D mcmcplot(fakemcmc)
##D 
##D ## mcmcplot works on bugs objects too
##D library(R2WinBUGS)
##D example("openbugs", "R2WinBUGS")
##D ## from the help file for openbugs:
##D schools.sim <- bugs(data, inits, parameters, model.file,
##D                     n.chains = 3, n.iter = 5000,
##D                     program = "openbugs", working.directory = NULL)
##D mcmcplot(schools.sim)
## End(Not run)



