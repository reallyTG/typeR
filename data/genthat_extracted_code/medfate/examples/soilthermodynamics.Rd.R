library(medfate)


### Name: soil thermodynamics
### Title: Soil thermodynamic functions
### Aliases: soil.thermalconductivity soil.thermalcapacity
###   soil.temperaturechange soil.temperaturegradient

### ** Examples

examplesoil = soil(defaultSoilParams())
soil.thermalconductivity(examplesoil)
soil.thermalcapacity(examplesoil)

#Values change when altering water content (drier layers have lower conductivity and capacity)
examplesoil$W = c(0.1, 0.4, 0.7, 1.0)
soil.thermalconductivity(examplesoil)
soil.thermalcapacity(examplesoil)



