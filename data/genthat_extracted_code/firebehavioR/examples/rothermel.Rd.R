library(firebehavioR)


### Name: rothermel
### Title: Rothermel Fire Behavior Modeling System
### Aliases: rothermel

### ** Examples

data(fuelModels, fuelMoisture)
#fuelModels['A10',]
exampSurfFuel = fuelModels['A10',]

#fuelMoisture['D1L1',]
exampFuelMoisture = fuelMoisture['D1L1',]

exampCrownFuel = data.frame(
 CBD = coForest$cbd_kgm3[1],
 FMC = 100,
 CBH = coForest$cbh_m[1],
 CFL = coForest$cfl_kgm2[1]
)

exampEnviro = data.frame(
 slope = 10,
 windspeed = 40,
 direction = 0,
 waf = 0.2
)
rothermel(exampSurfFuel, exampFuelMoisture, exampCrownFuel, exampEnviro)



