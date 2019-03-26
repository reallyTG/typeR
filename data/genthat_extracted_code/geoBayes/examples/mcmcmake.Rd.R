library(geoBayes)


### Name: mcmcmake
### Title: Convert to an 'mcmc' object
### Aliases: mcmcmake

### ** Examples

## Not run: 
##D  ### Load the data
##D data(rhizoctonia)
##D rhiz <- na.omit(rhizoctonia)
##D rhiz$IR <- rhiz$Infected/rhiz$Total # Incidence rate of the
##D                               # rhizoctonia disease
##D  ### Define the model
##D corrf <- "spherical"
##D ssqdf <- 1
##D ssqsc <- 1
##D tsqdf <- 1
##D tsqsc <- 1
##D betm0 <- 0
##D betQ0 <- diag(.01, 2, 2)
##D phiprior <- c(200, 1, 1000, 100) # U(100, 300)
##D phisc <- 1
##D omgprior <- c(3, 1, 1000, 0) # U(0, 3)
##D omgsc <- 1.3
##D linkp <- 1
##D ## MCMC parameters
##D Nout <- 100
##D Nbi <- 0
##D Nthin <- 1
##D  ### Run MCMC
##D sample <- mcstrga(Yield ~ IR, data = rhiz,
##D                   atsample = ~ Xcoord + Ycoord, corrf = corrf,
##D                   Nout = Nout, Nthin = Nthin,
##D                   Nbi = Nbi, betm0 = betm0, betQ0 = betQ0,
##D                   ssqdf = ssqdf, ssqsc = ssqsc,
##D                   tsqdf = tsqdf, tsqsc = tsqsc,
##D                   linkp = linkp,
##D                   corrprior = list(phi = phiprior, omg = omgprior), 
##D                   corrtuning = list(phi = phisc, omg = omgsc, kappa = 0),
##D                   test = FALSE)
##D mcsample <- mcmcmake(sample)
##D plot(mcsample[, c("phi", "omg", "beta_1", "beta_2", "ssq", "tsq")],
##D      density = FALSE)
##D summary(mcsample[, c("phi", "omg", "beta_1", "beta_2", "ssq", "tsq")])
## End(Not run)



