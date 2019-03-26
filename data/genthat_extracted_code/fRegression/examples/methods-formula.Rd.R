library(fRegression)


### Name: formula-methods
### Title: Extract Regressiom Model formula
### Aliases: formula-methods formula,ANY-method formula,fREG-method
### Keywords: models

### ** Examples

## regSim -
   x = regSim(model = "LM3", n = 50)
  
## regFit -
   fit = regFit(Y ~ X1 + X2 + X3, data = x, use = "lm")
   
## formula - 
   formula(fit)



