library(medfate)


### Name: Plant values
### Title: Plant description functions
### Aliases: plant.BasalArea plant.CharacterParameter plant.Cover
###   plant.CrownBaseHeight plant.CrownLength plant.CrownRatio
###   plant.Density plant.EquilibriumLeafLitter
###   plant.EquilibriumSmallBranchLitter plant.FoliarBiomass plant.Fuel
###   plant.Height plant.ID plant.Parameter plant.LAI
###   plant.LargerTreeBasalArea plant.Phytovolume plant.Species
###   plant.SpeciesName

### ** Examples

#Default species parameterization
data(SpParamsMED)

#Load example plot
data(exampleforest)

#A short way to obtain total basal area
sum(plant.BasalArea(exampleforest), na.rm=TRUE)

#The same forest level function for LAI
sum(plant.LAI(exampleforest, SpParamsMED))

#The same forest level function for fuel loading
sum(plant.Fuel(exampleforest, SpParamsMED))

#Summary function for 'forest' objects can be also used
summary(exampleforest, SpParamsMED)

plant.SpeciesName(exampleforest, SpParamsMED)

plant.ID(exampleforest)



