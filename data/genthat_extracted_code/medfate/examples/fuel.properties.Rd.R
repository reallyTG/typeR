library(medfate)


### Name: fuel.properties
### Title: Fuel stratification and fuel characteristics
### Aliases: fuel.FCCS fuel.cohortFineFMC fuel.Stratification
###   fuel.WindAdjustmentFactor

### ** Examples

#Load example plot plant data
data(exampleforest)

#Default species parameterization
data(SpParamsMED)

#Show stratification of fuels
fuel.Stratification(exampleforest, SpParamsMED)

#Calculate fuel properties according to FCCS
fccs = fuel.FCCS(exampleforest, 50,100, SpParamsMED)
fccs

fuel.WindAdjustmentFactor(fccs$htc[2], fccs$hbc[1], fccs$htc[1], fccs$cover[1])



