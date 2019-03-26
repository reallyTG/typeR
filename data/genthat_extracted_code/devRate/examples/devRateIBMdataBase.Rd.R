library(devRate)


### Name: devRateIBMdataBase
### Title: Forecast ectotherm phenology as a function of temperature and
###   development rate models available in the package database
### Aliases: devRateIBMdataBase

### ** Examples

forecastLactin2_95 <- devRateIBMdataBase(
  tempTS = rnorm(n = 20, mean = 20, sd = 1),
  timeStepTS = 10,
  eq = lactin2_95,
  species = "Sesamia nonagrioides",
  lifeStages = c("eggs", "larva", "pupa"),
  numInd = 10,
  stocha = 0.015,
  timeLayEggs = 1
)



