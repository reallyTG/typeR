library(tvReg)


### Name: tvSURE
### Title: Time-Varying Seemingly Unrelated Regression Equations Model
### Aliases: tvSURE tvsure-class tvsure
### Keywords: models, nonparametric regression statistics time varying

### ** Examples

## Not run: 
##D data("Kmenta", package = "systemfit")
##D eqDemand <- consump ~ price + income
##D eqSupply <- consump ~ price + farmPrice + trend
##D system <- list(demand = eqDemand, supply = eqSupply)
##D 
##D ##OLS estimation of a system
##D ols.fit <- systemfit::systemfit(system, method = "OLS", data = Kmenta)
##D ##tvOLS estimation of a system with the local linear estimator
##D tvols.fit <- tvSURE(system, data = Kmenta,  est = "ll")
##D 
##D ##SUR estimation
##D fgls1.fit <- systemfit::systemfit(system, data = Kmenta, method = "SUR")
##D ##tvSURE estimation
##D tvfgls1.fit <- tvSURE(system, data = Kmenta, method = "tvFGLS")
## End(Not run)




