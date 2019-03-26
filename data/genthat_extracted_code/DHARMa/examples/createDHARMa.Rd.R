library(DHARMa)


### Name: createDHARMa
### Title: Convert simulated residuals or posterior predictive simulations
###   to a DHARMa object
### Aliases: createDHARMa

### ** Examples

## READING IN HAND-CODED SIMULATIONS

testData = createData(sampleSize = 50, randomEffectVariance = 0)
fittedModel <- glm(observedResponse ~ Environment1, data = testData, family = "poisson")

# in DHARMA, using the simulate.glm function of glm 
sims = simulateResiduals(fittedModel)
plot(sims, quantreg = FALSE)

# Doing the same with a handcode simulate function. 
# of course this code will only work with a 1-par glm model
simulateMyfit <- function(n=10, fittedModel){
  int = coef(fittedModel)[1]
  slo = coef(fittedModel)[2]
  pred = exp(int + slo * testData$Environment1)
  predSim = replicate(n, rpois(length(pred), pred))
  return(predSim)
}

sims = simulateMyfit(250, fittedModel)

dharmaRes <- createDHARMa(simulatedResponse = sims, 
                          observedResponse = testData$observedResponse, 
                          fittedPredictedResponse = predict(fittedModel, type = "response"), 
                          integer = TRUE)
plot(dharmaRes, quantreg = FALSE)

## A BAYESIAN EXAMPLE

## Not run: 
##D   
##D   # This example shows how to check the residuals for a 
##D   # Bayesian fit of a process-based vegetation model, using
##D   # THe BayesianTools package
##D   
##D   library(BayesianTools)
##D   
##D   # Create input data for the model
##D   PAR <- VSEMcreatePAR(1:1000)
##D   plotTimeSeries(observed = PAR)
##D   
##D   # load reference parameter definition (upper, lower prior)
##D   refPars <- VSEMgetDefaults()
##D   # this adds one additional parameter for the likelihood standard deviation (see below)
##D   refPars[12,] <- c(2, 0.1, 4) 
##D   rownames(refPars)[12] <- "error-sd"
##D   
##D   # create some simulated test data 
##D   # generally recommended to start with simulated data before moving to real data
##D   referenceData <- VSEM(refPars$best[1:11], PAR) # model predictions with reference parameters  
##D   referenceData[,1] = 1000 * referenceData[,1] 
##D   # this adds the error - needs to conform to the error definition in the likelihood
##D   obs <- referenceData + rnorm(length(referenceData), sd = refPars$best[12])
##D   
##D   parSel = c(1:6, 12) # parameters to calibrate
##D   
##D   # here is the likelihood 
##D   likelihood <- function(par, sum = TRUE){
##D     # set parameters that are not calibrated on default values 
##D     x = refPars$best
##D     x[parSel] = par
##D     predicted <- VSEM(x[1:11], PAR) # replace here VSEM with your model 
##D     predicted[,1] = 1000 * predicted[,1] # this is just rescaling
##D     diff <- c(predicted[,1:4] - obs[,1:4]) # difference betweeno observed and predicted
##D     # univariate normal likelihood. Note that there is a parameter involved here that is fit
##D     llValues <- dnorm(diff, sd = x[12], log = TRUE)  
##D     if (sum == FALSE) return(llValues)
##D     else return(sum(llValues))
##D   }
##D   
##D   # optional, you can also directly provide lower, upper in the createBayesianSetup, see help
##D   prior <- createUniformPrior(lower = refPars$lower[parSel], 
##D                               upper = refPars$upper[parSel], best = refPars$best[parSel])
##D   
##D   bayesianSetup <- createBayesianSetup(likelihood, prior, names = rownames(refPars)[parSel])
##D   
##D   # settings for the sampler, iterations should be increased for real applicatoin
##D   settings <- list(iterations = 10000, nrChains = 2)
##D   
##D   out <- runMCMC(bayesianSetup = bayesianSetup, sampler = "DEzs", settings = settings)
##D   
##D   plot(out)
##D   summary(out)
##D   gelmanDiagnostics(out) # should be below 1.05 for all parameters to demonstrate convergence 
##D   
##D   # Posterior predictive simulations
##D   
##D   # Create a function to create posterior predictive simulations
##D   createPredictions <- function(par){
##D     # set the parameters that are not calibrated on default values 
##D     x = refPars$best
##D     x[parSel] = par
##D     predicted <- VSEM(x[1:11], PAR) * 1000 
##D     out = rnorm(length(predicted), mean = predicted, sd = par[7])
##D     return(out)
##D   }
##D   
##D   posteriorSample = getSample(out, numSamples = 1000)
##D   posteriorPredictiveSims = apply(posteriorSample, 1, createPredictions)
##D     
##D   dim(posteriorPredictiveSims)
##D   library(DHARMa)
##D   x = createDHARMa(t(posteriorPredictiveSims))
##D   plot(x)
## End(Not run)



