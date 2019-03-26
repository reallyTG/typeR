library(CreditRisk)


### Name: calibrate.sbtv
### Title: SBTV model calibration to market CDS data
### Aliases: calibrate.sbtv

### ** Examples

calibrate.sbtv(V0 = 1, p = c(0.95, 0.05), cdsrate = cdsdata$Par.spread,
r = cdsdata$ED.Zero.Curve, t = cdsdata$Maturity)




