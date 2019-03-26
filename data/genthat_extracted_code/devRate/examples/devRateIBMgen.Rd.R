library(devRate)


### Name: devRateIBMgen
### Title: Number of generations
### Aliases: devRateIBMgen

### ** Examples

data(exTropicalMoth)
forecastTsolanivora <- devRateIBM(
   tempTS = rnorm(n = 100, mean = 15, sd = 1),
   timeStepTS = 1,
   models = exTropicalMoth[[2]],
   numInd = 10,
   stocha = 0.015,
   timeLayEggs = 1)
devRateIBMgen(ibm = forecastTsolanivora)



