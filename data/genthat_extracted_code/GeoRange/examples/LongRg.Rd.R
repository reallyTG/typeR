library(GeoRange)


### Name: LongRg
### Title: Calculates the longitudinal range in degrees and kilometers,
###   assuming a latitude of 45 degrees for all points by default. Accounts
###   for the possibility of wrapping around the globe.
### Aliases: LongRg

### ** Examples

longs<-c(133,76,-77,7,-80)
lats<-c(45)
LongRg(longs)



