library(fOptions)


### Name: HestonNandiGarchFit
### Title: Heston-Nandi Garch(1,1) Modelling
### Aliases: HestonNandiGarchFit hngarchSim hngarchFit hngarchStats
###   print.hngarch summary.hngarch
### Keywords: models

### ** Examples

## hngarchSim -
   # Simulate a Heston Nandi Garch(1,1) Process:
   # Symmetric Model - Parameters:
   model = list(lambda = 4, omega = 8e-5, alpha = 6e-5, 
     beta = 0.7, gamma = 0, rf = 0)
   ts = hngarchSim(model = model, n = 500, n.start = 100)
   par(mfrow = c(2, 1), cex = 0.75)
   ts.plot(ts, col = "steelblue", main = "HN Garch Symmetric Model")
   grid()
   
## hngarchFit - 
   # HN-GARCH log likelihood Parameter Estimation:
   # To speed up, we start with the simulated model ...
   mle = hngarchFit(model = model, x = ts, symmetric = TRUE)
   mle
   
## summary.hngarch - 
   # HN-GARCH Diagnostic Analysis:
   par(mfrow = c(3, 1), cex = 0.75)
   summary(mle)    

## hngarchStats - 
   # HN-GARCH Moments:
   hngarchStats(mle$model)     



