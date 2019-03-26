library(medfate)


### Name: plot.spwb
### Title: Displays simulation results
### Aliases: plot.spwb plot.growth summary.spwb summary.growth

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
x = forest2spwbInput(exampleforest,examplesoil, SpParamsMED, control)

#Call simulation function
S1<-spwb(x, examplesoil, examplemeteo, elevation = 100)
        
#Plot results
plot(S1)

#Monthly summary (averages) of soil status
summary(S1, freq="months",FUN=mean, output="Soil")




