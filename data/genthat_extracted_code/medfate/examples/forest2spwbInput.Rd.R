library(medfate)


### Name: spwbInput
### Title: Input for simulation models
### Aliases: forest2aboveground forest2belowground forest2growthInput
###   forest2spwbInput growthInput spwbInput

### ** Examples

#Load example plot plant data
data(exampleforest)

#Default species parameterization
data(SpParamsMED)

# Aboveground parameters
above = forest2aboveground(exampleforest, SpParamsMED)
above

# Initialize soil with default soil params
examplesoil = soil(defaultSoilParams())

# Belowground parameters
below = forest2belowground(exampleforest, examplesoil, SpParamsMED)
below

# Initialize control parameters
control = defaultControl()

# Prepare spwb input
spwbInput(above, below, examplesoil,SpParamsMED, control)

# When starting from an object of class 'forest' the whole process
# can be simplified:
forest2spwbInput(exampleforest, examplesoil, SpParamsMED, control)


# Prepare input for complex transpiration mode
control$transpirationMode = "Complex"
forest2spwbInput(exampleforest,examplesoil,SpParamsMED, control)




