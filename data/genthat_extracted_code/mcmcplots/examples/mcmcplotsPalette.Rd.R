library(mcmcplots)


### Name: mcmcplotsPalette
### Title: Color Palette for the mcmcplots Package
### Aliases: mcmcplotsPalette
### Keywords: color

### ** Examples

colorpie <- function(n, type="rainbow") pie(rep(1, n), col=mcmcplotsPalette(n, type=type))
colorpie(1)
colorpie(8)
colorpie(4, type="sequential")
colorpie(4, type="grayscale")

## Create fake MCMC output
nc <- 10; nr <- 1000
pnames <- c(paste("alpha[", 1:5, "]", sep=""), paste("gamma[", 1:5, "]", sep=""))
means <- rpois(10, 20)
fakemcmc <- coda::as.mcmc.list(
    lapply(1:3,
           function(i) coda::mcmc(matrix(rnorm(nc*nr, rep(means,each=nr)),
                                         nrow=nr, dimnames=list(NULL,pnames)))))

denplot(fakemcmc)
denplot(fakemcmc, style="plain", col=mcmcplotsPalette(3, type="sequential"))
denplot(fakemcmc, style="plain", col=mcmcplotsPalette(3, type="grayscale"))




