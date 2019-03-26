library(geoBayes)


### Name: bf1skel
### Title: Computation of Bayes factors at the skeleton points
### Aliases: bf1skel

### ** Examples

## Not run: 
##D data(rhizoctonia)
##D ### Define the model
##D corrf <- "spherical"
##D kappa <- 0
##D ssqdf <- 1
##D ssqsc <- 1
##D betm0 <- 0
##D betQ0 <- .01
##D family <- "binomial.probit"
##D ### Skeleton points
##D philist <- c(100, 140, 180)
##D omglist <- c(.5, 1)
##D parlist <- expand.grid(linkp=0, phi=philist, omg=omglist, kappa = kappa)
##D ### MCMC sizes
##D Nout <- 100
##D Nthin <- 1
##D Nbi <- 0
##D ### Take MCMC samples
##D runs <- list()
##D for (i in 1:NROW(parlist)) {
##D   runs[[i]] <- mcsglmm(Infected ~ 1, family, rhizoctonia, weights = Total,
##D                        atsample = ~ Xcoord + Ycoord,
##D                        Nout = Nout, Nthin = Nthin, Nbi = Nbi,
##D                        betm0 = betm0, betQ0 = betQ0,
##D                        ssqdf = ssqdf, ssqsc = ssqsc,
##D                        phi = parlist$phi[i], omg = parlist$omg[i],
##D                        linkp = parlist$linkp[i], kappa = parlist$kappa[i],
##D                        corrfcn = corrf,
##D                        corrtuning=list(phi = 0, omg = 0, kappa = 0))
##D }
##D bf <- bf1skel(runs)
##D bf$logbf
## End(Not run)



