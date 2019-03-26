library(statmod)


### Name: growthcurve
### Title: Compare Groups of Growth Curves
### Aliases: compareGrowthCurves compareTwoGrowthCurves plotGrowthCurves
### Keywords: regression

### ** Examples

# A example with only one time
data(PlantGrowth)
compareGrowthCurves(PlantGrowth$group,as.matrix(PlantGrowth$weight))
# Can make p-values more accurate by nsim=10000



