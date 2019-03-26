library(mcmcplots)


### Name: rmeanplot1
### Title: Running Mean Plot for a Single Parameter in MCMC Output
### Aliases: rmeanplot1
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

rmeanplot(fakemcmc[, "alpha[5]", drop=FALSE])
rmeanplot(fakemcmc[, "alpha[5]", drop=FALSE], style="plain")



