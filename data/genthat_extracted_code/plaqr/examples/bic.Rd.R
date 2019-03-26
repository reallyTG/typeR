library(plaqr)


### Name: bic
### Title: BIC for the Partially Linear Additive Quantile Regression Model
### Aliases: bic

### ** Examples

data(simData)

ss <- vector("list", 2)

ss[[2]]$degree <- 3
fit1 <- plaqr(y~., nonlinVars=~z1+z2, data=simData, splinesettings=ss) 

ss[[2]]$degree <- 4
fit2 <- plaqr(y~., nonlinVars=~z1+z2, data=simData, splinesettings=ss) 

ss[[2]]$degree <- 5
fit3 <- plaqr(y~., nonlinVars=~z1+z2, data=simData, splinesettings=ss) 

bic(fit1)
bic(fit2)
bic(fit3)



