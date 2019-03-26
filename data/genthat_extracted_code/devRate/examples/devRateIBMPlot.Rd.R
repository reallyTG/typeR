library(devRate)


### Name: devRateIBMPlot
### Title: Plot phenology table
### Aliases: devRateIBMPlot

### ** Examples

data(exTropicalMoth)
forecastTsolanivora <- devRateIBM(
   tempTS = rnorm(n = 100, mean = 15, sd = 1),
   timeStepTS = 1,
   models = exTropicalMoth[[2]],
   numInd = 10,
   stocha = 0.015,
   timeLayEggs = 1)
devRateIBMPlot(ibm = forecastTsolanivora, typeG = "density", threshold = 0.1)
devRateIBMPlot(ibm = forecastTsolanivora, typeG = "hist")



