library(CreditRisk)


### Name: calibrate.cds
### Title: Calibrate the default intensities to market CDS data
### Aliases: calibrate.cds

### ** Examples

calibrate.cds( r = cdsdata$ED.Zero.Curve, t = seq(.5, 30, by = 0.5),
               T = c(1, 2, 3, 4, 5, 7, 10, 20, 30), cdsrate = cdsdata$Par.spread, RR = 0.4)




