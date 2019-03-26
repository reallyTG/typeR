library(nimble)


### Name: runCrossValidate
### Title: Perform k-fold cross-validation on a NIMBLE model fit by MCMC
### Aliases: runCrossValidate

### ** Examples

## Not run: 
##D 
##D ## We conduct CV on the classic "dyes" BUGS model.
##D 
##D dyesCode <- nimbleCode({
##D   for (i in 1:BATCHES) {
##D     for (j in 1:SAMPLES) {
##D       y[i,j] ~ dnorm(mu[i], tau.within);
##D     }
##D     mu[i] ~ dnorm(theta, tau.between);
##D   }
##D 
##D   theta ~ dnorm(0.0, 1.0E-10);
##D   tau.within ~ dgamma(0.001, 0.001);  sigma2.within <- 1/tau.within;
##D   tau.between ~ dgamma(0.001, 0.001);  sigma2.between <- 1/tau.between;
##D })
##D 
##D dyesData <- list(y = matrix(c(1545, 1540, 1595, 1445, 1595,
##D                               1520, 1440, 1555, 1550, 1440,
##D                               1630, 1455, 1440, 1490, 1605,
##D                               1595, 1515, 1450, 1520, 1560, 
##D                               1510, 1465, 1635, 1480, 1580,
##D                               1495, 1560, 1545, 1625, 1445), 
##D                               nrow = 6, ncol = 5))
##D                               
##D dyesConsts <- list(BATCHES = 6,
##D                    SAMPLES = 5)
##D                    
##D dyesInits <- list(theta = 1500, tau.within = 1, tau.between =  1)
##D 
##D dyesModel <- nimbleModel(code = dyesCode,
##D                          constants = dyesConsts,
##D                          data = dyesData,
##D                          inits = dyesInits)
##D 
##D # Define the fold function.
##D # This function defines the data to leave out for the i'th fold
##D # as the i'th row of the data matrix y.  This implies we will have
##D # 6 folds.
##D 
##D dyesFoldFunction <- function(i){
##D   foldNodes_i <- paste0('y[', i, ', ]')  # will return 'y[1,]' for i = 1 e.g.
##D   return(foldNodes_i)
##D }
##D 
##D # We define our own loss function as well.
##D # The function below will compute the root mean squared error.
##D 
##D RMSElossFunction <- function(simulatedDataValues, actualDataValues){
##D   dataLength <- length(simulatedDataValues) # simulatedDataValues is a vector
##D   SSE <- 0
##D   for(i in 1:dataLength){
##D     SSE <- SSE + (simulatedDataValues[i] - actualDataValues[i])^2
##D   }
##D   MSE <- SSE / dataLength
##D   RMSE <- sqrt(MSE)
##D   return(RMSE)
##D }
##D 
##D dyesMCMCconfiguration <- configureMCMC(dyesModel)
##D   
##D crossValOutput <- runCrossValidate(MCMCconfiguration = dyesMCMCconfiguration,
##D                                    k = 6,
##D                                    foldFunction = dyesFoldFunction,
##D                                    lossFunction = RMSElossFunction,
##D                                    MCMCcontrol = list(niter = 5000,
##D                                                       nburnin = 500))
## End(Not run)  




