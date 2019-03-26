library(gogarch)


### Name: gogarch
### Title: Specification and estimation of GO-GARCH models
### Aliases: gogarch
### Keywords: models

### ** Examples

## Not run: 
##D library(vars)
##D ## Boswijk / van der Weide (2009)
##D data(BVDWSTOXX)
##D BVDWSTOXX <- zoo(x = BVDWSTOXX[, -1], order.by = BVDWSTOXX[, 1])
##D BVDWSTOXX <- window(BVDWSTOXX, end = as.POSIXct("2007-12-31"))
##D BVDWSTOXX <- diff(log(BVDWSTOXX))
##D sectors <- BVDWSTOXX[, c("AutoParts", "Banks", "OilGas")]
##D sectors <- apply(sectors, 2, scale, scale = FALSE)
##D gogmm <- gogarch(sectors, formula = ~garch(1,1), estby = "mm",
##D          lag.max = 100)
##D gogmm
##D ## Boswijk / van der Weide (2006)
##D data(BVDW)
##D BVDW <- zoo(x = BVDW[, -1], order.by = BVDW[, 1])
##D BVDW <- diff(log(BVDW)) * 100
##D gognls <- gogarch(BVDW, formula = ~garch(1,1), scale = TRUE,
##D           estby = "nls")
##D gognls
##D ## van der Weide (2002)
##D data(VDW)
##D var1 <- VAR(scale(VDW), p = 1, type = "const")
##D resid <- residuals(var1)
##D gogml <- gogarch(resid, ~garch(1, 1), scale = TRUE,
##D          estby = "ml", control = list(iter.max = 1000))
##D gogml
##D solve(gogml@Z)
## End(Not run)



