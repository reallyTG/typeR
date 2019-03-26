library(fRegression)


### Name: summary-methods
### Title: Regression Summary Methods
### Aliases: summary-methods summary,ANY-method summary,fREG-method
### Keywords: models

### ** Examples

## regSim -
   x <- regSim(model = "LM3", n = 50)
  
## regFit -
   fit <- regFit(Y ~ X1 + X2 + X3, data = x, use = "lm")
   
## summary
   summary(fit)



