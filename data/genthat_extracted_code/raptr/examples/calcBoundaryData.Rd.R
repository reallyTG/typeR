library(raptr)


### Name: calcBoundaryData
### Title: Calculate boundary data for planning units
### Aliases: calcBoundaryData calcBoundaryData.PolySet
###   calcBoundaryData.SpatialPolygons

### ** Examples

# simulate planning units
sim_pus <- sim.pus(225L)

# calculate boundary data
bound.dat <- calcBoundaryData(sim_pus)

# print summary of boundary data
summary(bound.dat)




