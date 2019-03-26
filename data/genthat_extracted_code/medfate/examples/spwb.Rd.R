library(medfate)


### Name: spwb
### Title: Soil-plant water balance
### Aliases: spwb spwb.resetInputs

### ** Examples

#Load example daily meteorological data
data(examplemeteo)

#Load example plot plant data
data(exampleforest)

#Default species parameterization
data(SpParamsMED)

#Initialize soil with default soil params (2 layers)
examplesoil = soil(defaultSoilParams(2))

#Initialize control parameters
control = defaultControl()

#Initialize input
x1 = forest2spwbInput(exampleforest,examplesoil, SpParamsMED, control)

#Call simulation function
S1<-spwb(x1, examplesoil, examplemeteo, elevation = 100)
        
#Plot results
plot(S1)

#Monthly summary (averages) of soil water balance
summary(S1, freq="months",FUN=mean, output="Soil")



#Initialize soil with default soil params (2 layers)
examplesoil2 = soil(defaultSoilParams(2))

#Switch to 'Complex' transpiration mode
control$transpirationMode="Complex"

#Initialize input
x2 = forest2spwbInput(exampleforest,examplesoil2, SpParamsMED, control)

#Call simulation function (5 days)
S2<-spwb(x2, examplesoil2, examplemeteo[100:105,], latitude = 41.82592, elevation = 100)




