library(STMedianPolish)


### Name: DemMeta
### Title: Digital Elevation Model Resolution 90 meters.
### Aliases: DemMeta
### Keywords: datasets

### ** Examples

library(sp)
data(DemMeta)
Gridxy<- spsample(DemMeta, cellsize=2000, n=300,"regular")
plot(Gridxy)



