library(mlVAR)


### Name: mlVARcompare
### Title: Compare mlVAR model fit
### Aliases: mlVARcompare

### ** Examples

## Not run: 
##D ### Small example ###
##D # Simulate data:
##D Model <- mlVARsim(nPerson = 50, nNode = 3, nTime = 50, lag=1)
##D 
##D # Estimate using different methods:
##D fit1 <- mlVAR(Model$Data, vars = Model$vars, idvar = Model$idvar, lags = 1, 
##D     temporal = "correlated")
##D fit2 <- mlVAR(Model$Data, vars = Model$vars, idvar = Model$idvar, lags = 1, 
##D     temporal = "orthogonal")
##D fit3 <- mlVAR(Model$Data, vars = Model$vars, idvar = Model$idvar, lags = 1, 
##D     temporal = "fixed")
##D 
##D # Compare models:
##D mlVARcompare(fit1,fit2,fit3)
## End(Not run)



