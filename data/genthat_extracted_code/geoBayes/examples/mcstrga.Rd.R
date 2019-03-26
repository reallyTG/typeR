library(geoBayes)


### Name: mcstrga
### Title: MCMC samples from the transformed Gaussian model
### Aliases: mcstrga

### ** Examples

## Not run: 
##D ### Load the data
##D data(rhizoctonia)
##D rhiz <- na.omit(rhizoctonia)
##D rhiz$IR <- rhiz$Infected/rhiz$Total # Incidence rate of the
##D                               # rhizoctonia disease
##D 
##D ### Define the model
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
##D 
##D ## MCMC parameters
##D Nout <- 100
##D Nbi <- 0
##D Nthin <- 1
##D 
##D samplt <- mcstrga(Yield ~ IR, data = rhiz,
##D                   atsample = ~ Xcoord + Ycoord, corrf = corrf,
##D                   Nout = Nout, Nthin = Nthin,
##D                   Nbi = Nbi, betm0 = betm0, betQ0 = betQ0,
##D                   ssqdf = ssqdf, ssqsc = ssqsc,
##D                   tsqdf = tsqdf, tsqsc = tsqsc,
##D                   corrprior = list(phi = phiprior, omg = omgprior),
##D                   linkp = linkp,
##D                   corrtuning = list(phi = phisc, omg = omgsc, kappa = 0),
##D                   test=10)
##D 
##D sample <- update(samplt, test = FALSE)
## End(Not run)



