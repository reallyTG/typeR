library(osmose)


### Name: getFishingMortality
### Title: Get fishing mortality rate.
### Aliases: getFishingMortality

### ** Examples

{
filename = system.file("extdata", "data_fishing.csv", package="osmose")
conf = readOsmoseConfiguration(filename)
ndt = getOsmoseParameter(conf, "simulation", "time", "ndtperyear")
nyear = getOsmoseParameter(conf, "simulation", "time", "nyear")

fishing = conf$mortality$fishing

fish0 = getFishingMortality("sp0", fishing, nyear, ndt)
}



