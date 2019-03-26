library(osmose)


### Name: getFishingBaseRate
### Title: Get fishing base rate.
### Aliases: getFishingBaseRate

### ** Examples

{
filename = system.file("extdata", "data_fishing.csv", package="osmose")
conf = readOsmoseConfiguration(filename)
ndt = getOsmoseParameter(conf, "simulation", "time", "ndtperyear")
nyear = getOsmoseParameter(conf, "simulation", "time", "nyear")

fishing = conf$mortality$fishing

fish0 = getFishingBaseRate("sp0", fishing, nyear, ndt)
}



