library(mcmcplots)


### Name: denplot
### Title: Density Plots for MCMC Parameters on a Single Plot
### Aliases: denplot
### Keywords: hplot

### ** Examples

## Create fake MCMC output
nc <- 10; nr <- 1000
pnames <- c(paste("alpha[", 1:5, "]", sep=""), paste("gamma[", 1:5, "]", sep=""))
means <- rpois(10, 20)
fakemcmc <- coda::as.mcmc.list(
    lapply(1:3,
           function(i) coda::mcmc(matrix(rnorm(nc*nr, rep(means,each=nr)),
                                         nrow=nr, dimnames=list(NULL,pnames)))))

## Plot densities of the fake MCMC output
denplot(fakemcmc)
denplot(fakemcmc, style="plain")
denplot(fakemcmc, collapse=TRUE, greek=TRUE, ci=0.95)
denplot(fakemcmc, xlim=range(unlist(fakemcmc)),
        plot.title="Density plots of fake data. Yawn.")
denplot(fakemcmc, "gamma")
denplot(fakemcmc, "gamma", "alpha\\[[12]]$") # all gamma and alpha[1] and alpha[2]

## What happens with NULL varnames?
coda::varnames(fakemcmc) <- NULL
denplot(fakemcmc)

## Not run: 
##D ## denplot works on bugs objects too
##D library(R2WinBUGS)
##D example("openbugs", "R2WinBUGS")
##D ## from the help file for openbugs:
##D schools.sim <- bugs(data, inits, parameters, model.file,
##D                     n.chains = 3, n.iter = 5000,
##D                     program = "openbugs", working.directory = NULL)
##D denplot(schools.sim, "theta")
## End(Not run)



