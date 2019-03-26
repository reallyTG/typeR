library(mcmcplots)


### Name: mcmcplots-package
### Title: Plots for MCMC Output
### Aliases: mcmcplots-package mcmcplots
### Keywords: package

### ** Examples

## Not run: 
##D ## mcmcplots functions work on bugs objects too
##D library(R2WinBUGS)
##D example("openbugs", "R2WinBUGS")
##D ## from the help file for openbugs:
##D schools.sim <- bugs(data, inits, parameters, model.file,
##D                     n.chains = 3, n.iter = 5000,
##D                     program = "openbugs", working.directory = NULL)
##D caterplot(schools.sim, "theta")
##D traplot(schools.sim, "theta")
##D denplot(schools.sim, "theta")
##D mcmcplot(schools.sim)
## End(Not run)

## Create fake MCMC output
nc <- 10; nr <- 1000
pnames <- c(paste("alpha[", 1:5, "]", sep=""), paste("gamma[", 1:5, "]", sep=""))
means <- rpois(10, 20)
fakemcmc <- coda::as.mcmc.list(
    lapply(1:3,
           function(i) coda::mcmc(matrix(rnorm(nc*nr, rep(means,each=nr)),
                                         nrow=nr, dimnames=list(NULL,pnames)))))

## Use mcmcplot to plot
## the fake MCMC output
## Not run: 
##D mcmcplot(fakemcmc)
##D mcmcplot(fakemcmc, "gamma")
##D mcmcplot(fakemcmc, regex="alpha\\[[12]")
##D mcmcplot(fakemcmc, "gamma", "alpha\\[[12]")
##D mcmcplot(fakemcmc, random=2)
##D mcmcplot(fakemcmc, random=c(2, 3))
## End(Not run)

## Use traplot to create
## trace plots of fake MCMC data
traplot(fakemcmc)
traplot(fakemcmc, "gamma")
traplot(fakemcmc, "gamma", "alpha\\[[12]]$") # all gamma and alpha[1] and alpha[2]

## Use denplot to create
## density plots of fake MCMC data
denplot(fakemcmc)
denplot(fakemcmc, "gamma")
denplot(fakemcmc, "gamma", "alpha\\[[12]]$") # all gamma and alpha[1] and alpha[2]

## Use caterplot to create
## caterpillar plots of fake MCMC data
par(mfrow=c(2,2))
caterplot(fakemcmc, "alpha", collapse=FALSE)
caterplot(fakemcmc, "gamma", collapse=FALSE)
caterplot(fakemcmc, "alpha", labels.loc="axis", col="blue")
caterplot(fakemcmc, "gamma", labels.loc="above", col="red")

## Use caterplot to create
## caterpillar plots of fake MCMC data
## with density strips
caterplot(fakemcmc, "alpha", collapse=FALSE, denstrip=TRUE)
caterplot(fakemcmc, "gamma", collapse=FALSE, denstrip=TRUE)
caterplot(fakemcmc, "alpha", labels.loc="axis", col="blue", denstrip=TRUE)
caterplot(fakemcmc, "gamma", labels.loc="above", col="red", denstrip=TRUE)

## Overlay caterplots
caterplot(fakemcmc, "alpha", collapse=TRUE)
caterplot(fakemcmc, "gamma", collapse=TRUE, add=TRUE, cat.shift=-0.3)

## Use denoverplot to create overlaying density plots
## of all parameters in fake MCMC data
fakemcmc2 <- coda::as.mcmc.list(
    lapply(1:3,
           function(i) coda::mcmc(matrix(rnorm(nc*nr, rep(means, each=nr)),
                                         nrow=nr, dimnames=list(NULL,pnames)))))
denoverplot(fakemcmc, fakemcmc2)

## Use corplot to create a "heat plot" of a
## correlation matrix of the fake MCMC draws
corplot(cor(as.matrix(fakemcmc)), cex.axis=0.75)  ## not exciting
Rho1 <- outer(1:10, 1:10, function(i, j) 0.5^(abs(i-j)))
Rho2 <- outer(1:5, 1:5, function(i, j) 0.25^(i!=j))
dat1 <- t(apply(matrix(rnorm(10*1000), 1000, 10), 1,
                function(z, Rho1) crossprod(Rho1, z), Rho1))
dat2 <- t(apply(matrix(rnorm(5*1000), 1000, 5), 1,
                function(z, Rho2) crossprod(Rho2,z), Rho2))
colnames(dat1) <- paste("theta[", 1:10, "]", sep="")
colnames(dat2) <- paste("alpha[", 1:5, "]", sep="")
dat <- cbind(dat1, dat2)
parcorplot(dat, "theta", col=gray(31:0/31), cex.axis=0.75)  ## just theta parameters
parcorplot(dat, col=heat.colors(31), cex.axis=0.75)
parcorplot(dat, col=topo.colors(31), cex.axis=0.75)
parcorplot(dat, col=terrain.colors(31), cex.axis=0.75)
parcorplot(dat, col=cm.colors(31), cex.axis=0.75)



