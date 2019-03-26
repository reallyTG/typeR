library(fGarch)


### Name: garchSim
### Title: Univariate GARCH/APARCH Time Series Simulation
### Aliases: garchSim
### Keywords: models

### ** Examples

## garchSpec -
   spec = garchSpec()
   spec

## garchSim -
   # Simulate a "timeSeries" object:
   x = garchSim(spec, n = 50)
   class(x)
   print(x) 
   
## More simulations ...

   # Default GARCH(1,1) - uses default parameter settings
   spec = garchSpec(model = list())
   garchSim(spec, n = 10)
   
   # ARCH(2) - use default omega and specify alpha, set beta=0!
   spec = garchSpec(model = list(alpha = c(0.2, 0.4), beta = 0))
   garchSim(spec, n = 10)
   
   # AR(1)-ARCH(2) - use default mu, omega
   spec = garchSpec(model = list(ar = 0.5, alpha = c(0.3, 0.4), beta = 0))
   garchSim(spec, n = 10)
   
   # AR([1,5])-GARCH(1,1) - use default garch values and subset ar[.]
   spec = garchSpec(model = list(mu = 0.001, ar = c(0.5,0,0,0,0.1)))
   garchSim(spec, n = 10)
   
   # ARMA(1,2)-GARCH(1,1) - use default garch values
   spec = garchSpec(model = list(ar = 0.5, ma = c(0.3, -0.3)))  
   garchSim(spec, n = 10)
   
   # GARCH(1,1) - use default omega and specify alpha/beta
   spec = garchSpec(model = list(alpha = 0.2, beta = 0.7))
   garchSim(spec, n = 10)
   
   # GARCH(1,1) - specify omega/alpha/beta
   spec = garchSpec(model = list(omega = 1e-6, alpha = 0.1, beta = 0.8))
   garchSim(spec, n = 10)
   
   # GARCH(1,2) - use default omega and specify alpha[1]/beta[2]
   spec = garchSpec(model = list(alpha = 0.1, beta = c(0.4, 0.4)))
   garchSim(spec, n = 10)
   
   # GARCH(2,1) - use default omega and specify alpha[2]/beta[1]
   spec = garchSpec(model = list(alpha = c(0.12, 0.04), beta = 0.08))
   garchSim(spec, n = 10)
   
   # snorm-ARCH(1) - use defaults with skew Normal
   spec = garchSpec(model = list(beta = 0, skew = 0.8), cond.dist = "snorm")
   garchSim(spec, n = 10)
   
   # sged-GARCH(1,1) - using defaults with skew GED
   model = garchSpec(model = list(skew = 0.93, shape = 3), cond.dist = "sged")
   garchSim(model, n = 10)
   
   # Taylor Schwert GARCH(1,1) - this belongs to the family of APARCH Models
   spec = garchSpec(model = list(delta = 1))
   garchSim(spec, n = 10)
   
   # AR(1)-t-APARCH(2, 1) - a little bit more complex specification ...
   spec = garchSpec(model = list(mu = 1.0e-4, ar = 0.5, omega = 1.0e-6, 
       alpha = c(0.10, 0.05), gamma = c(0, 0), beta = 0.8, delta = 1.8, 
       shape = 4, skew = 0.85), cond.dist = "sstd")
   garchSim(spec, n = 10)



