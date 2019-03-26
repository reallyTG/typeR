library(binGroup)


### Name: residuals.gt
### Title: Extract Model Residuals From a Fitted Group Testing Model
### Aliases: residuals.gt
### Keywords: regression models

### ** Examples


data(hivsurv)

fit1 <- gtreg(formula = groupres ~ AGE * EDUC., data = hivsurv, groupn = gnum,  
              linkf = "probit")
residuals.gt(object = fit1, type = "pearson")
residuals.gt(object = fit1, type = "deviance")




