library(synlik)


### Name: slice
### Title: Plot slices of the synthetic log-likelihood.
### Aliases: slice

### ** Examples

data(ricker_sl)

# Plotting slices of the logLikelihood
slice(object = ricker_sl, 
     ranges = list("logR" = seq(3.5, 3.9, by = 0.01),
                   "logPhi" = seq(2, 2.6, by = 0.01),
                    "logSigma" = seq(-2, -0.5, by = 0.01)), 
     param = c(logR = 3.8, logSigma = log(0.3), logPhi = log(10)), 
     nsim = 500)
            
## Not run: 
##D # Plotting a contour of the logLikelihood
##D slice(object = ricker_sl, 
##D      ranges = list("logR" = seq(3.5, 3.9, by = 0.01),
##D                    "logPhi" = seq(2, 2.6, by = 0.01),
##D                    "logSigma" = seq(-2, -0.5, by = 0.04)), 
##D      pairs = TRUE,
##D      param = c(logR = 3.8, logSigma = log(0.3), logPhi = log(10)), 
##D      nsim = 500, multicore = TRUE)   
## End(Not run)                     



