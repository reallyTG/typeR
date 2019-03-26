library(medfate)


### Name: spwb.day
### Title: Soil-plant water balance for a single day
### Aliases: spwb.day

### ** Examples

#Load example daily meteorological data
data(examplemeteo)

#Load example plot plant data
data(exampleforest)

#Default species parameterization
data(SpParamsMED)

#Initialize control parameters
control = defaultControl()

#Initialize soil with default soil params (2 layers)
examplesoil = soil(defaultSoilParams(2), W=c(0.5,0.5))


#Simulate one day only
x1 = forest2spwbInput(exampleforest,examplesoil, SpParamsMED, control)
d = 100
sd1<-spwb.day(x1, examplesoil, rownames(examplemeteo)[d],  
             examplemeteo$MinTemperature[d], examplemeteo$MaxTemperature[d], 
             examplemeteo$MinRelativeHumidity[d], examplemeteo$MaxRelativeHumidity[d], 
             examplemeteo$Radiation[d], examplemeteo$WindSpeed[d], 
             latitude = 41.82592, elevation = 100, slope=0, aspect=0,
             prec = examplemeteo$Precipitation[d])

#Initialize soil with default soil params (2 layers)
examplesoil2 = soil(defaultSoilParams(2))

#Switch to 'Complex' transpiration mode
control$transpirationMode="Complex"


#Simulate one day only
x2 = forest2spwbInput(exampleforest,examplesoil2, SpParamsMED, control)
d = 100
sd2<-spwb.day(x2, examplesoil2, rownames(examplemeteo)[d],
             examplemeteo$MinTemperature[d], examplemeteo$MaxTemperature[d], 
             examplemeteo$MinRelativeHumidity[d], examplemeteo$MaxRelativeHumidity[d], 
             examplemeteo$Radiation[d], examplemeteo$WindSpeed[d], 
             latitude = 41.82592, elevation = 100, slope=0, aspect=0,
             prec = examplemeteo$Precipitation[d])

#Plot plant transpiration (see function 'plot.swb.day()')
plot(sd2)




