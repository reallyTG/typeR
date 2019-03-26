library(spaMM)


### Name: AIC
### Title: Extractors for informations criteria such as AIC
### Aliases: get_any_IC AIC AIC.HLfit extractAIC extractAIC.HLfit
### Keywords: models

### ** Examples

data("wafers")
m1 <- HLfit(y ~X1+X2+(1|batch),
          resid.model = ~ 1 ,data=wafers,HLmethod="ML")
get_any_IC(m1) 
extractAIC(m1)



