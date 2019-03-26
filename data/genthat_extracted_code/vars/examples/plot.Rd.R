library(vars)


### Name: plot
### Title: Plot methods for objects in vars
### Aliases: plot.varcheck plot.varest plot.varfevd plot.varirf plot.varprd
###   plot.varstabil plot.vec2var
### Keywords: regression

### ** Examples

## Not run: 
##D data(Canada)
##D var.2c <- VAR(Canada, p = 2, type = "const")
##D plot(var.2c)
##D ## Diagnostic Testing
##D ## ARCH test
##D archtest <- arch.test(var.2c)
##D plot(archtest)
##D ## Normality test
##D normalitytest <- normality.test(var.2c)
##D plot(normalitytest)
##D ## serial correlation test
##D serialtest <- serial.test(var.2c)
##D plot(serialtest)
##D ## FEVD
##D var.2c.fevd <- fevd(var.2c, n.ahead = 5)
##D plot(var.2c.fevd)
##D ## IRF
##D var.2c.irf <- irf(var.2c, impulse = "e",
##D response = c("prod", "rw", "U"), boot = FALSE)
##D plot(var.2c.irf)
##D ## Prediction
##D var.2c.prd <- predict(var.2c, n.ahead = 8, ci = 0.95)
##D plot(var.2c.prd)
##D ## Stability
##D var.2c.stabil <- stability(var.2c, type = "Rec-CUSUM")
##D plot(var.2c.stabil)
## End(Not run)



