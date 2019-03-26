library(BayesianTools)


### Name: VSEM
### Title: Very simple ecosystem model
### Aliases: VSEM

### ** Examples


  
## This example shows how to run and calibrate the VSEM model 

library(BayesianTools)

# Create input data for the model
PAR <- VSEMcreatePAR(1:1000)
plot(PAR, main = "PAR (driving the model)", xlab = "Day")

# load reference parameter definition (upper, lower prior)
refPars <- VSEMgetDefaults()
# this adds one additional parameter for the likelihood standard deviation (see below)
refPars[12,] <- c(2, 0.1, 4) 
rownames(refPars)[12] <- "error-sd"
head(refPars)

# create some simulated test data 
# generally recommended to start with simulated data before moving to real data
referenceData <- VSEM(refPars$best[1:11], PAR) # model predictions with reference parameters  
referenceData[,1] = 1000 * referenceData[,1] 
# this adds the error - needs to conform to the error definition in the likelihood
obs <- referenceData + rnorm(length(referenceData), sd = refPars$best[12])
oldpar <- par(mfrow = c(2,2))
for (i in 1:4) plotTimeSeries(observed = obs[,i], 
                              predicted = referenceData[,i], main = colnames(referenceData)[i])

# Best to program in a way that we can choose easily which parameters to calibrate
parSel = c(1:6, 12)

# here is the likelihood 
likelihood <- function(par, sum = TRUE){
  # set parameters that are not calibrated on default values 
  x = refPars$best
  x[parSel] = par
  predicted <- VSEM(x[1:11], PAR) # replace here VSEM with your model 
  predicted[,1] = 1000 * predicted[,1] # this is just rescaling
  diff <- c(predicted[,1:4] - obs[,1:4]) # difference betweeno observed and predicted
  # univariate normal likelihood. Note that there is a parameter involved here that is fit
  llValues <- dnorm(diff, sd = x[12], log = TRUE)  
  if (sum == FALSE) return(llValues)
  else return(sum(llValues))
}

# optional, you can also directly provide lower, upper in the createBayesianSetup, see help
prior <- createUniformPrior(lower = refPars$lower[parSel], 
                            upper = refPars$upper[parSel], best = refPars$best[parSel])

bayesianSetup <- createBayesianSetup(likelihood, prior, names = rownames(refPars)[parSel])

# settings for the sampler, iterations should be increased for real applicatoin
settings <- list(iterations = 2000, nrChains = 2)

out <- runMCMC(bayesianSetup = bayesianSetup, sampler = "DEzs", settings = settings)

## Not run: 
##D 
##D plot(out)
##D summary(out)
##D marginalPlot(out)
##D gelmanDiagnostics(out) # should be below 1.05 for all parameters to demonstrate convergence 
##D 
##D # Posterior predictive simulations
##D 
##D # Create a prediction function
##D createPredictions <- function(par){
##D   # set the parameters that are not calibrated on default values 
##D   x = refPars$best
##D   x[parSel] = par
##D   predicted <- VSEM(x[1:11], PAR) # replace here VSEM with your model 
##D   return(predicted[,1] * 1000)
##D }
##D 
##D # Create an error function
##D createError <- function(mean, par){
##D   return(rnorm(length(mean), mean = mean, sd = par[7]))
##D }
##D 
##D # plot prior predictive distribution and prior predictive simulations
##D plotTimeSeriesResults(sampler = out, model = createPredictions, observed = obs[,1],
##D                       error = createError, prior = TRUE, main = "Prior predictive")
##D 
##D # plot posterior predictive distribution and posterior predictive simulations
##D plotTimeSeriesResults(sampler = out, model = createPredictions, observed = obs[,1],
##D                       error = createError, main = "Posterior predictive")
##D 
##D 
##D ########################################################
##D # Demonstrating the updating of the prior from old posterior
##D # Note that it is usually more exact to rerun the MCMC 
##D # with all (old and new) data, instead of updating the prior
##D # because likely some information is lost when approximating the
##D # Posterior by a multivariate normal 
##D 
##D settings <- list(iterations = 5000, nrChains = 2)
##D 
##D out <- runMCMC(bayesianSetup = bayesianSetup, sampler = "DEzs", settings = settings)
##D 
##D plot(out)
##D correlationPlot(out, start = 1000)
##D 
##D newPrior = createPriorDensity(out, method = "multivariate",
##D                               eps = 1e-10,
##D                               lower = refPars$lower[parSel],
##D                               upper = refPars$upper[parSel], start= 1000)
##D 
##D bayesianSetup <- createBayesianSetup(likelihood = likelihood,
##D                                      prior = newPrior,
##D                                      names = rownames(refPars)[parSel] )
##D 
##D # check boundaries are correct set
##D bayesianSetup$prior$sampler() < refPars$lower[parSel]
##D bayesianSetup$prior$sampler() > refPars$upper[parSel]
##D 
##D # check prior looks similar to posterior
##D x = bayesianSetup$prior$sampler(2000)
##D correlationPlot(x, thin = F)
##D 
##D out <- runMCMC(bayesianSetup = bayesianSetup, sampler = "DEzs", settings = settings)
##D 
##D plot(out)
##D correlationPlot(out)
##D 
##D plotTimeSeriesResults(sampler = out,
##D                       model = createPredictions,
##D                       observed = obs[,1],
##D                       error = createError,
##D                       prior = F, main = "Posterior predictive")
##D 
##D plotTimeSeriesResults(sampler = out,
##D                       model = createPredictions,
##D                       observed = obs[,1],
##D                       error = createError,
##D                       prior = T, main = "Prior predictive")
##D 
##D 
##D 
##D 
## End(Not run)

par(oldpar)



