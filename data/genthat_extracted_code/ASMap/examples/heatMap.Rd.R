library(ASMap)


### Name: heatMap
### Title: Heat map of the estimated pairwise recombination fractions and
###   LOD linkage between markers.
### Aliases: heatMap
### Keywords: graphics

### ** Examples


data(mapDH, package = "ASMap")

## bulking linkage groups and reconstructing entire linkage map

test1 <- mstmap(mapDH, bychr = FALSE, dist.fun = "kosambi",
                trace = FALSE)

## plot heat map of result

heatMap(test1, lmax = 30)




