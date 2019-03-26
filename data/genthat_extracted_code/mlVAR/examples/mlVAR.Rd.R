library(mlVAR)


### Name: mlVAR
### Title: Multilevel VAR Estimation for Multiple Time Series
### Aliases: mlVAR

### ** Examples

## Not run: 
##D ### Small example ###
##D # Simulate data:
##D Model <- mlVARsim(nPerson = 50, nNode = 3, nTime = 50, lag=1)
##D 
##D # Estimate using correlated random effects:
##D fit1 <- mlVAR(Model$Data, vars = Model$vars, idvar = Model$idvar, lags = 1, temporal = "correlated")
##D 
##D # Print some pointers:
##D print(fit1)
##D 
##D # Summary of all parameter estimates:
##D summary(fit1)
##D 
##D # Compare temporal relationships:
##D layout(t(1:2))
##D plot(Model, "temporal", title = "True temporal relationships", layout = "circle")
##D plot(fit1, "temporal", title = "Estimated temporal relationships", layout = "circle")
##D 
##D # Compare contemporaneous partial correlations:
##D layout(t(1:2))
##D plot(Model, "contemporaneous", title = "True contemporaneous relationships", 
##D     layout = "circle")
##D plot(fit1, "contemporaneous", title = "Estimated contemporaneous relationships", 
##D     layout = "circle")
##D 
##D # Compare between-subjects partial correlations:
##D layout(t(1:2))
##D plot(Model, "between", title = "True between-subjects relationships", layout = "circle")
##D plot(fit1, "between", title = "Estimated between-subjects relationships", 
##D     layout = "circle")
##D 
##D # Run same model with non-correlated temporal relationships and fixed-effect model:
##D fit2 <- mlVAR(Model$Data, vars = Model$vars, idvar = Model$idvar, lags = 1, 
##D     temporal = "orthogonal")
##D fit3 <- mlVAR(Model$Data, vars = Model$vars, idvar = Model$idvar, lags = 1, 
##D     temporal = "fixed")
##D 
##D # Compare models:
##D mlVARcompare(fit1,fit2,fit3)
##D 
##D # Inspect true parameter correlation matrix:
##D Model$model$Omega$cor$mean
##D # Even though correlations are high, orthogonal model works well often!
##D 
##D 
##D ### Large example ###
##D Model <- mlVARsim(nPerson = 100, nNode = 10, nTime = 100,lag=1)
##D 
##D # Correlated random effects no longer practical. Use orthogonal or fixed:
##D fit4 <- mlVAR(Model$Data, vars = Model$vars, idvar = Model$idvar, lags = 1, 
##D     temporal = "orthogonal")
##D fit5 <- mlVAR(Model$Data, vars = Model$vars, idvar = Model$idvar, lags = 1, 
##D     temporal = "fixed")
##D 
##D # Compare models:
##D mlVARcompare(fit4, fit5)
##D 
##D # Compare temporal relationships:
##D layout(t(1:2))
##D plot(Model, "temporal", title = "True temporal relationships", layout = "circle")
##D plot(fit4, "temporal", title = "Estimated temporal relationships", layout = "circle")
##D 
##D # Compare contemporaneous partial correlations:
##D layout(t(1:2))
##D plot(Model, "contemporaneous", title = "True contemporaneous relationships", 
##D     layout = "circle")
##D plot(fit4, "contemporaneous", title = "Estimated contemporaneous relationships", 
##D     layout = "circle")
##D 
##D # Compare between-subjects partial correlations:
##D layout(t(1:2))
##D plot(Model, "between", title = "True between-subjects relationships", layout = "circle")
##D plot(fit4, "between", title = "Estimated between-subjects relationships", 
##D     layout = "circle")
## End(Not run)



