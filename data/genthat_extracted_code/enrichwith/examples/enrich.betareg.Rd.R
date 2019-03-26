library(enrichwith)


### Name: enrich.betareg
### Title: Enrich objects of class betareg
### Aliases: enrich.betareg

### ** Examples


## Not run: 
##D if (require("betareg")) {
##D 
##D    data("GasolineYield", package = "betareg")
##D    gy <- betareg(yield ~ batch + temp, data = GasolineYield)
##D 
##D    # Get a function that evaluates the expected information for gy at supplied parameter values
##D    gy_info <- get_information_function(gy)
##D .   # compare standard errors with what `summary` returns
##D    all.equal(sqrt(diag(solve(gy_info())))[1:11],
##D              coef(summary(gy))$mean[, 2], check.attributes = FALSE)
##D .   # evaluating at different parameter values
##D    gy_info(rep(1, length = 12))
##D 
##D    # Get a function that evaluates the first-order bias of gy at supplied parameter values
##D    gy_bias <- get_bias_function(gy)
##D    # compare with internal betareg implementation of bias correction
##D    gy_bc <- update(gy, type = "BC")
##D    all.equal(gy_bias(coef(gy)), gy_bc$bias, check.attributes = FALSE)
##D 
##D  }
## End(Not run)




