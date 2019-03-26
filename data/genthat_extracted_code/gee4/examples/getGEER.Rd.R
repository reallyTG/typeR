library(gee4)


### Name: getGEER
### Title: Extract or Get Generalized Components from a Fitted
###   GEE-MCD/WGEE-MCD Model
### Aliases: getGEER getGEER.geerMod

### ** Examples

fitgee.ar1 <- geer(cd4|id|time ~ 1|1, data = aids, triple =
  c(6,3,3), method = 'gee-mcd', corr.struct = 'ar1', rho = 0.5, control =
  geerControl(trace=TRUE))

sd  <- getGEER(fitgee.ar1, "sd")
QIC <- getGEER(fitgee.ar1, "QIC")
Di  <- getGEER(fitgee.ar1, "D", 10)




