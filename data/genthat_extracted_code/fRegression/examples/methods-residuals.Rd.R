library(fRegression)


### Name: residuals-methods
### Title: Extract Regression Model Residuals
### Aliases: residuals-methods residuals,ANY-method residuals,fREG-method
### Keywords: models

### ** Examples

## regSim -
   x = regSim(model = "LM3", n = 50)
  
## regFit -
   fit = regFit(Y ~ X1 + X2 + X3, data = x, use = "lm")
   
## residuals - 
   residuals(fit)



