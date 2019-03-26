library(fRegression)


### Name: show-methods
### Title: Regression Modelling Show Methods
### Aliases: show-methods show,ANY-method show,fREG-method
### Keywords: models

### ** Examples

## regSim -
   x <- regSim(model = "LM3", n = 50)
  
## regFit -
   fit <- regFit(Y ~ X1 + X2 + X3, data = x, use = "lm")
   
## print -
   print(fit)



