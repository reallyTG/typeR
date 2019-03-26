library(statmod)


### Name: meanT
### Title: Mean t-Statistic Between Two Groups of Growth Curves
### Aliases: meanT
### Keywords: regression

### ** Examples

y1 <- matrix(rnorm(4*3),4,3)
y2 <- matrix(rnorm(4*3),4,3)
meanT(y1,y2)

data(PlantGrowth)
compareGrowthCurves(PlantGrowth$group,as.matrix(PlantGrowth$weight))
# Can make p-values more accurate by nsim=10000



