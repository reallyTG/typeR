library(DriftBurstHypothesis)


### Name: drift_bursts
### Title: Drift Bursts
### Aliases: drift_bursts

### ** Examples


#Simulate from a stochastic volatility model.
#Both a flash crash and flash rally are coded into the function.
StochasticVolatilitySim = function(iT, dSigma, dPhi, dMu){
  vSim = numeric(iT)
  vEps = rnorm(iT , sd =dSigma)
  vEpsy = rnorm(iT)
  vEps[30001:32000] = rnorm(2000 ,sd =seq(from = dSigma , 
                                          to = 2*dSigma , length.out = 2000)) 
  vEps[32001:34000] = rnorm(2000 ,sd =seq(from = 2*dSigma , 
                                          to = dSigma , length.out = 2000))
  vEpsy[30001:32000] = -rnorm(2000 ,mean =seq(from = 0,
                                              to = 0.3 , length.out = 2000)) 
  vEpsy[32001:34000] = -rnorm(2000 ,mean =seq(from = 0.3,
                                              to = 0 , length.out = 2000))
  
  
  vEps[60001:63000] = rnorm(3000,sd = seq(from = dSigma , 
                                            to = 2*dSigma , length.out = 3000))
  vEps[63001:66000] = rnorm(3000,  sd = seq(from = 2*dSigma , 
                                              to =  dSigma, length.out = 3000))
  
  vEpsy[60001:63000] = rnorm(3000 ,mean =seq(from = 0,
                                               to = 0.2 , length.out = 3000))
  vEpsy[63001:66000] = rnorm(3000 ,mean =seq(from = 0.2,
                                               to = 0 , length.out = 3000))
  vSim[1] = dMu + dPhi *rnorm(1 , mean = dMu , sd = dSigma /sqrt(1-dPhi^2))
  for (i in 2:iT) {
    vSim[i] = dMu + dPhi * (vSim[(i-1)] - dMu) + vEps[i]
  }
  vY = exp(vSim/2) * vEpsy
  return(vY)
}

iT = 66500; dSigma = 0.3; dPhi = 0.98; dMu = -10;

set.seed(123)
vY = 500+cumsum(StochasticVolatilitySim(iT, dSigma, dPhi, dMu))

#insert an outlier to illustrate robustness.
vY[50000] = 500

#Here, the observations are equidistant, but the code can handle 
#unevenly spaced observations.
timestamps = seq(34200 , 57600 , length.out = iT)
testtimes = seq(34200, 57600, 60)
logprices = log(vY)

DBHtStat = drift_bursts(timestamps,  logprices, 
                        testtimes, PreAverage = 5, AcLag = -1L,
                        Mean_bandwidth = 300L, Variance_bandwidth = 900L, 
                        bParallelize = FALSE)

#plot series
plot(vY , x = timestamps/86400 , type = 'l')
#plot test statistic
plot(DBHtStat$DriftBursts, x = testtimes/86400, type = 'l')




