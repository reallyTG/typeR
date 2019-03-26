library(devRate)


### Name: devRateIBM
### Title: Forecast ectotherm phenology as a function of temperature and
###   development rate models
### Aliases: devRateIBM

### ** Examples

data(exTropicalMoth)
forecastTsolanivora <- devRateIBM(
   tempTS = rnorm(n = 100, mean = 15, sd = 1),
   timeStepTS = 1,
   models = exTropicalMoth[[2]],
   numInd = 100,
   stocha = c(0.015, 0.005, 0.01),
   timeLayEggs = 1)



