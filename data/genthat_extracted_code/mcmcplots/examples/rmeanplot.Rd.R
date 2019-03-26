library(mcmcplots)


### Name: rmeanplot
### Title: Running Mean Plots of Multiple Parameters
### Aliases: rmeanplot
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

## Plot traces of the fake MCMC output
rmeanplot(fakemcmc)
rmeanplot(fakemcmc, style="plain")
rmeanplot(fakemcmc, "gamma", greek=TRUE)



