library(STMedianPolish)


### Name: HZRMeta
### Title: Hydrogeological zone west of Meta river.
### Aliases: HZRMeta
### Keywords: datasets

### ** Examples

library(sp)
data(HZRMeta)
Gridxy<- spsample(HZRMeta, cellsize=2000, n=300,"regular")
plot(Gridxy)



