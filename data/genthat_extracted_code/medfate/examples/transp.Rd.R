library(medfate)


### Name: transp
### Title: Transpiration submodel functions
### Aliases: transp.profitMaximization transp.stomatalRegulation
###   transp.stomatalRegulationPlot

### ** Examples

#Load example daily meteorological data
data(examplemeteo)

#Load example plot plant data
data(exampleforest)

#Default species parameterization
data(SpParamsMED)

#Initialize soil with default soil params (2 layers)
examplesoil2 = soil(defaultSoilParams(2))

#Initialize control parameters
control = defaultControl()
#Switch to 'Complex' transpiration mode
control$transpirationMode="Complex"

#Initialize input
x2 = forest2spwbInput(exampleforest,examplesoil2, SpParamsMED, control)

transp.stomatalRegulationPlot(x2, examplesoil2, examplemeteo, day=100, timestep = 12,
                              latitude = 41.82592, elevation = 100)



