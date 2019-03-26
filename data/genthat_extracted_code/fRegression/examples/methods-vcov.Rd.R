library(fRegression)


### Name: vcov-methods
### Title: Extract Regression Model vcov
### Aliases: vcov-methods vcov,ANY-method vcov,fREG-method
### Keywords: models

### ** Examples

## regSim -
   x <- regSim(model = "LM3", n = 50)
  
## regFit -
   fit <- regFit(Y ~ X1 + X2 + X3, data = x, use = "lm")
   
## vcov - 
   vcov(fit)



