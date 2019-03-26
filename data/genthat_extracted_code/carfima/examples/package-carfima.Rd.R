library(carfima)


### Name: package-carfima
### Title: Continuous-Time Fractionally Integrated ARMA Process for
###   Irregularly Spaced Long-Memory Time Series Data
### Aliases: package-carfima package-carfima-package

### ** Examples

## No test: 
##### Irregularly spaced observation time generation.

length.time <- 10
time.temp <- rexp(length.time, rate = 2)
time <- rep(NA, length.time + 1)
time[1] <- 0
for (i in 2 : (length.time + 1)) {
  time[i] <- time[i - 1] + time.temp[i - 1]
 }
 time <- time[-1]
 
 ##### Data genration for CARFIMA(1, H, 0) based on the observation times. 

 parameter <- c(-0.4, 0.75, 0.2) 
 # AR parameter alpha = -0.4
 # Hurst parameter = 0.75
 # process uncertainty (standard deviation) sigma = 0.2
 y <- carfima.sim(parameter = parameter, time = time, ar.p = 1, ma.q = 0)  
 
 ##### Fitting the CARFIMA(1, H, 0) model on the simulated data for MLEs.
 
 res <- carfima(Y = y, time = time, method = "mle", ar.p = 1, ma.q = 0)
 
 # It takes a long time due to the differential evolution algorithm (global optimizer).
 # res$mle; res$se; res$AIC; res$fitted.values
 
 ##### Fitting the CARFIMA(1, H, 0) model on the simulated data for Bayesian inference.
 res <- carfima(Y = y, time = time, method = "bayes",
                ar.p = 1, ma.q = 0, 
                bayes.param.ini = parameter, 
                bayes.param.scale = c(rep(0.2, length(parameter))), 
                bayes.n.warm = 100, bayes.n.sample = 1000)
                
 # It takes a long time because the likelihood evaluation is computationally heavy.
 # The last number of bayes.param.scale is to update sigma2 (not sigma) on a log scale.
 # hist(res$param[, 1]); res$accept; res$AIC; res$fitted.values
 
 ##### Computing the log likelihood of the CARFIMA(1, H, 0) model given the parameters.
 
 loglik <- carfima.loglik(Y = y, time = time, ar.p = 1, ma.q = 0,
                          parameter = parameter, fitted = FALSE)
## End(No test)



