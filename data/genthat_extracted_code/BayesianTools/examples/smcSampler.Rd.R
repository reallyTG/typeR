library(BayesianTools)


### Name: smcSampler
### Title: SMC sampler
### Aliases: smcSampler

### ** Examples

## Example for the use of SMC 
# First we need a bayesianSetup - SMC makes most sense if we can  for demonstration,
# we'll write a function that puts out the number of model calls

MultiNomialNoCor <- generateTestDensityMultiNormal(sigma = "no correlation")

parallelLL <- function(parMatrix){
  print(paste("Calling likelihood with", nrow(parMatrix), "parameter combinations"))
  out = apply(parMatrix, 1, MultiNomialNoCor)
  return(out)
}

bayesianSetup <- createBayesianSetup(likelihood = parallelLL, lower = rep(-10, 3),
                                     upper = rep(10, 3), parallel = "external")

# Defining settings for the sampler
# First we use the sampler for rejection sampling
settings <- list(initialParticles = 1000, iterations = 1, resampling = FALSE)  
   
# Running the sampler
out1 <- runMCMC(bayesianSetup = bayesianSetup, sampler = "SMC", settings = settings)
#plot(out1)


# Now for sequential Monte Carlo
settings <- list(initialParticles = 100, iterations = 5, resamplingSteps = 1)
out2 <- runMCMC(bayesianSetup = bayesianSetup, sampler = "SMC", settings = settings)
#plot(out2)

## Not run: 
##D 
##D ## Example for starting a new SMC run with results from a previous SMC run
##D 
##D # Generate example data (time series)
##D # x1 and x2 are predictory, yObs is the response
##D t <- seq(1, 365)
##D x1 <- (sin( 1 / 160 * 2 * pi * t) + pi) * 5
##D x2 <- cos( 1 / 182.5 * 1.25 * pi * t) * 12
##D 
##D # the model
##D mod <- function(par, t1 = 1, tn = 365) {
##D   par[1] * x1[t1:tn] + par[2] * x2[t1:tn]
##D }
##D 
##D # the true parameters
##D par1 <- 1.65
##D par2 <- 0.75
##D yObs <- mod(c(par1, par2)) + rnorm(length(x1), 0, 2)
##D 
##D # split the time series in half
##D plot(yObs ~ t)
##D abline(v = 182, col = "red", lty = 2)
##D 
##D # First half of the data
##D ll_1 <- function(x, sum = TRUE) {
##D   out <- dnorm(mod(x, 1, 182) - yObs[1:182], 0, 2, log = TRUE)
##D   if (sum == TRUE) sum(out) else out
##D }
##D 
##D # Fit the first half of the time series
##D # (e.g. fit the model to the data soon as you collect the data)
##D setup_1 <- createBayesianSetup(ll_1, lower = c(-10, -10), upper = c(10, 10))
##D settings_1 <- list(initialParticles = 1000)
##D out_1 <- runMCMC(setup_1, "SMC", settings_1)
##D summary(out_1)
##D 
##D 
##D # Second half of the data
##D ll_2 <- function(x, sum = TRUE) {
##D   out <- dnorm(mod(x, 183, 365) - yObs[183:365], 0, 2, log = TRUE)
##D   if (sum == TRUE) sum(out) else out
##D }
##D 
##D # Fit the second half of the time series
##D # (e.g. fit the model to the data soon as you collect the data)
##D setup_2 <- createBayesianSetup(ll_2, lower = c(-10, -10), upper = c(10, 10))
##D 
##D # This is the important step, we use the final particles from the
##D # previous SMC run to initialize the new SMC run
##D settings_2 <- list(initialParticles = out_1$particles)
##D out_2 <- runMCMC(setup_2, "SMC", settings_2)
##D summary(out_2)
##D 
##D par_pred <- apply(out_2$particles, 2, median)
##D pred <- mod(par_pred)
##D plotTimeSeries(yObs, pred)
##D 
## End(Not run)









