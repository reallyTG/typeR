library(medfate)


### Name: Vertical profiles
### Title: Vertical profiles
### Aliases: vprofile.LeafAreaDensity vprofile.RootDistribution
###   vprofile.FuelBulkDensity vprofile.PARExtinction
###   vprofile.SWRExtinction vprofile.WindExtinction

### ** Examples

#Default species parameterization
data(SpParamsMED)

#Load example plot plant data
data(exampleforest)

vprofile.LeafAreaDensity(exampleforest, SpParamsMED)
vprofile.FuelBulkDensity(exampleforest, SpParamsMED)

vprofile.PARExtinction(exampleforest, SpParamsMED)
vprofile.SWRExtinction(exampleforest, SpParamsMED)

vprofile.WindExtinction(exampleforest, SpParamsMED, 20)




