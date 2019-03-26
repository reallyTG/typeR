library(imageData)


### Name: GrowthRates
### Title: Calculates growth rates (AGR, PGR, RGRdiff) between pairs of
###   values in a vector
### Aliases: GrowthRates AGRdiff PGR RGRdiff
### Keywords: data manip

### ** Examples

data(exampleData)
longi.dat$Area.AGR <- with(longi.dat, AGRdiff(Area, time.diffs = Days.diffs))



