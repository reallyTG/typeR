library(fRegression)


### Name: fitted-methods
### Title: Extract Regression Model Fitted Values
### Aliases: fitted-methods fitted,ANY-method fitted,fREG-method
### Keywords: models

### ** Examples

## regSim -
   x.df = regSim(model = "LM3", n = 50)
  
## regFit -
   # Use data.frame input:
   fit = regFit(Y ~ X1 + X2 + X3, data = x.df, use = "lm")
   
## fitted - 
   val = slot(fit, "fitted")
   head(val)
   class(val)
   val = fitted(fit)
   head(val)
   class(val)
   
## regFit -
   # Convert to dummy timeSeries Object:
   x.tS = as.timeSeries(x.df)
   fit = regFit(Y ~ X1 + X2 + X3, data = x.tS, use = "lm")
   
## fitted - 
   val = slot(fit, "fitted")
   head(val)
   class(val)
   val = fitted(fit)
   head(val)
   class(val)



