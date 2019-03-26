library(fRegression)


### Name: coef-methods
### Title: REG coefficients Methods
### Aliases: coef-methods coef,ANY-method coef,fREG-method
### Keywords: models

### ** Examples

## regSim -
   x = regSim(model = "LM3", n = 50)
  
## regFit -
   fit = regFit(Y ~ X1 + X2 + X3, data = x, use = "lm")
   
## coef - 
   coef(fit)



