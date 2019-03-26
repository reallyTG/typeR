library(mcmcplots)


### Name: denoverplot
### Title: Overlaying Densities for Parameters from two MCMC Simulations.
### Aliases: denoverplot
### Keywords: hplot

### ** Examples

## Create fake MCMC output
nc <- 10; nr <- 1000
pnames <- c(paste("alpha[", 1:5, "]", sep=""), paste("gamma[", 1:5, "]", sep=""))
means <- rpois(10, 20)
fakemcmc <- coda::as.mcmc.list(
    lapply(1:3,
           function(i) coda::mcmc(matrix(rnorm(nc*nr, rep(means, each=nr)),
                                         nrow=nr, dimnames=list(NULL,pnames)))))
fakemcmc2 <- coda::as.mcmc.list(
    lapply(1:3,
           function(i) coda::mcmc(matrix(rnorm(nc*nr, rep(means, each=nr)),
                                         nrow=nr, dimnames=list(NULL,pnames)))))

## Plot the fake MCMC output
denoverplot(fakemcmc, fakemcmc2)
denoverplot(fakemcmc, fakemcmc2, style="plain",
            col=mcmcplotsPalette(3, type="grayscale"),
            ci=0.95, greek=TRUE)
denoverplot(fakemcmc, fakemcmc2,
            plot.title="Comparison of densities of fake data")
denoverplot(fakemcmc, fakemcmc2,
            plot.title="Comparison of densities of fake data", greek=TRUE)




