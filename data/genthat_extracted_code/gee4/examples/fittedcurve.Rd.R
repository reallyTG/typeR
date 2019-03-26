library(gee4)


### Name: fittedcurve
### Title: Plot Fitted Curves for One or More geerMod Objects
### Aliases: fittedcurve

### ** Examples

fitgee.ar1 <- geer(cd4|id|time ~ 1|1, data = aids, triple =
  c(6,3,3), method = 'gee-mcd', corr.struct = 'ar1', rho = 0.5)
fittedcurve(fitgee.ar1, text = "GEE-MCD fitted curve", include.CI = TRUE)




