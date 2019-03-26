library(geoBayes)


### Name: mcsglmm
### Title: MCMC samples from the Spatial GLMM
### Aliases: mcsglmm

### ** Examples

## Not run: 
##D data(rhizoctonia)
##D 
##D ### Create prediction grid
##D predgrid <- mkpredgrid2d(rhizoctonia[c("Xcoord", "Ycoord")],
##D                          par.x = 100, chull = TRUE, exf = 1.2)
##D 
##D ### Combine observed and prediction locations
##D rhizdata <- stackdata(rhizoctonia, predgrid$grid)
##D ##'
##D ### Define the model
##D corrf <- "spherical"
##D family <- "binomial.probit"
##D kappa <- 0
##D ssqdf <- 1
##D ssqsc <- 1
##D betm0 <- 0
##D betQ0 <- .01
##D phiprior <- c(100, 1, 1000, 100) # U(100, 200)
##D phisc <- 3
##D omgprior <- c(2, 1, 1, 0)        # Exp(mean = 2)
##D omgsc <- .1
##D ##'
##D ### MCMC sizes
##D Nout <- 100
##D Nthin <- 1
##D Nbi <- 0
##D 
##D ### Trial run
##D emt <- mcsglmm(Infected ~ 1, family, rhizdata, weights = Total,
##D                atsample = ~ Xcoord + Ycoord,
##D                Nout = Nout, Nthin = Nthin, Nbi = Nbi,
##D                betm0 = betm0, betQ0 = betQ0, ssqdf = ssqdf, ssqsc = ssqsc,
##D                corrpriors = list(phi = phiprior, omg = omgprior), 
##D                corrfcn = corrf, kappa = kappa,
##D                corrtuning = list(phi = phisc, omg = omgsc, kappa = 0),
##D                dispersion = 1, test = 10)
##D 
##D ### Full run
##D emc <- update(emt, test = FALSE)
##D 
##D emcmc <- mcmcmake(emc)
##D summary(emcmc[, c("phi", "omg", "beta", "ssq")])
##D plot(emcmc[, c("phi", "omg", "beta", "ssq")])
## End(Not run)



