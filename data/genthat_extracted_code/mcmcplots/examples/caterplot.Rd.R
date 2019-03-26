library(mcmcplots)


### Name: caterplot
### Title: Caterpillar Plots of MCMC Output
### Aliases: caterplot
### Keywords: hplot

### ** Examples

## Create fake MCMC output
nc <- 10; nr <- 1000
pnames <- c(paste("alpha[1,", 1:5, "]", sep=""), paste("gamma[", 1:5, "]", sep=""))
means <- rpois(10, 20)
fakemcmc <- coda::as.mcmc.list(
    lapply(1:3,
           function(i)
               coda::mcmc(matrix(rnorm(nc*nr, rep(means, each=nr)),
                                 nrow=nr, dimnames=list(NULL,pnames)))))

## caterplot plots of the fake MCMC output
par(mfrow=c(2,2))
caterplot(fakemcmc, "alpha", collapse=FALSE)
caterplot(fakemcmc, "gamma", collapse=FALSE)
caterplot(fakemcmc, "alpha", labels.loc="axis", greek=TRUE, col="blue")
caterplot(fakemcmc, "gamma", labels.loc="above", greek=TRUE, col="red")

caterplot(fakemcmc, "alpha", collapse=FALSE, denstrip=TRUE)
caterplot(fakemcmc, "gamma", collapse=FALSE, denstrip=TRUE)
caterplot(fakemcmc, "alpha", labels.loc="axis", col="blue", denstrip=TRUE)
caterplot(fakemcmc, "gamma", labels.loc="above", col="red", denstrip=TRUE)

caterplot(fakemcmc, "alpha", collapse=FALSE, style="plain")
caterplot(fakemcmc, "gamma", collapse=FALSE, style="plain")
caterplot(fakemcmc, "alpha", labels.loc="axis")
caterplot(fakemcmc, "gamma", labels.loc="above")

caterplot(fakemcmc, "alpha", horizontal=FALSE)
caterplot(fakemcmc, horizontal=FALSE)
caterpoints(rnorm(10, 21, 2), horizontal=FALSE, pch="x", col="red")
caterplot(fakemcmc, horizontal=FALSE, denstrip=TRUE, col="blue", pch=NA)
caterplot(fakemcmc, horizontal=FALSE, col="red", pch=19, add=TRUE)
caterplot(fakemcmc, denstrip=TRUE, col="blue", pch=NA)
caterplot(fakemcmc, col="purple", pch=19, add=TRUE)

## Overlay caterplots
caterplot(fakemcmc, "alpha", collapse=TRUE)
caterplot(fakemcmc, "gamma", collapse=TRUE, add=TRUE, cat.shift=-0.3)

## What happens with NULL varnames?
coda::varnames(fakemcmc) <- NULL
caterplot(fakemcmc)
caterplot(fakemcmc, collapse=FALSE)

## Not run: 
##D ## caterplot works on bugs objects too:
##D library(R2WinBUGS)
##D example("openbugs", "R2WinBUGS")
##D ## from the help file for openbugs:
##D schools.sim <- bugs(data, inits, parameters, model.file,
##D                     n.chains = 3, n.iter = 5000,
##D                     program = "openbugs", working.directory = NULL)
##D caterplot(schools.sim, "theta")
## End(Not run)



