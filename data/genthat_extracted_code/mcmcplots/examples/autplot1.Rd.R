library(mcmcplots)


### Name: autplot1
### Title: Autocorrelation Plot of MCMC Output
### Aliases: autplot1
### Keywords: hplot

### ** Examples

## Create fake MCMC output
nc <- 10; nr <- 1000
pnames <- c(paste("alpha[", 1:5, "]", sep=""), paste("gamma[", 1:5, "]", sep=""))
means <- rpois(10, 20)
fakemcmc <-
    coda::as.mcmc.list(
        lapply(1:3,
               function(i)
                   coda::mcmc(matrix(rnorm(nc*nr, rep(means,each=nr)),
                                     nrow=nr, dimnames=list(NULL,pnames)))))

autplot1(fakemcmc[, "alpha[1]", drop=FALSE])
autplot1(fakemcmc[, "alpha[1]", drop=FALSE], chain=2, style="plain")
autplot1(fakemcmc[, "alpha[1]", drop=FALSE], partial=TRUE)




