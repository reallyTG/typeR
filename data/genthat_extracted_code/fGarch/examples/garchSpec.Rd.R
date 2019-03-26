library(fGarch)


### Name: garchSpec
### Title: Univariate GARCH Time Series Specification
### Aliases: garchSpec
### Keywords: models

### ** Examples

## garchSpec -

   # Normal Conditional Distribution:
   spec = garchSpec()
   spec
   
   # Skewed Normal Conditional Distribution:
   spec = garchSpec(model = list(skew = 0.8), cond.dist = "snorm")
   spec
   
   # Skewed GED Conditional Distribution:
   spec = garchSpec(model = list(skew = 0.9, shape = 4.8), cond.dist = "sged")
   spec
   
## More specifications ...

   # Default GARCH(1,1) - uses default parameter settings
   garchSpec(model = list())
   
   # ARCH(2) - use default omega and specify alpha, set beta=0!
   garchSpec(model = list(alpha = c(0.2, 0.4), beta = 0))
   
   # AR(1)-ARCH(2) - use default mu, omega
   garchSpec(model = list(ar = 0.5, alpha = c(0.3, 0.4), beta = 0))
   
   # AR([1,5])-GARCH(1,1) - use default garch values and subset ar[.]
   garchSpec(model = list(mu = 0.001, ar = c(0.5,0,0,0,0.1)))
   
   # ARMA(1,2)-GARCH(1,1) - use default garch values
   garchSpec(model = list(ar = 0.5, ma = c(0.3, -0.3)))  
   
   # GARCH(1,1) - use default omega and specify alpha/beta
   garchSpec(model = list(alpha = 0.2, beta = 0.7))
   
   # GARCH(1,1) - specify omega/alpha/beta
   garchSpec(model = list(omega = 1e-6, alpha = 0.1, beta = 0.8))
   
   # GARCH(1,2) - use default omega and specify alpha[1]/beta[2]
   garchSpec(model = list(alpha = 0.1, beta = c(0.4, 0.4)))
   
   # GARCH(2,1) - use default omega and specify alpha[2]/beta[1]
   garchSpec(model = list(alpha = c(0.12, 0.04), beta = 0.08))
   
   # snorm-ARCH(1) - use defaults with skew Normal
   garchSpec(model = list(beta = 0, skew = 0.8), cond.dist = "snorm")
   
   # sged-GARCH(1,1) - using defaults with skew GED
   garchSpec(model = list(skew = 0.93, shape = 3), cond.dist = "sged")
   
   # Taylor Schwert GARCH(1,1) - this belongs to the family of APARCH Models
   garchSpec(model = list(delta = 1))
   
   # AR(1)-t-APARCH(2, 1) - a little bit more complex specification ...
   garchSpec(model = list(mu = 1.0e-4, ar = 0.5, omega = 1.0e-6, 
       alpha = c(0.10, 0.05), gamma = c(0, 0), beta = 0.8, delta = 1.8, 
       shape = 4, skew = 0.85), cond.dist = "sstd")



