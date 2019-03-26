library(meteoland)


### Name: SpatialPointsTopography
### Title: Creates a 'SpatialPointsTopography'
### Aliases: SpatialPointsTopography

### ** Examples

data(examplegridtopography)

#Creates spatial topography points from the grid
p = 1:2
points = as(examplegridtopography,"SpatialPoints")[p]
spt = SpatialPointsTopography(points, examplegridtopography$elevation[p],
                              examplegridtopography$slope[p],
                              examplegridtopography$aspect[p])
spt

#Alternatively, use coercing and subsetting
spt = as(examplegridtopography, "SpatialPointsTopography")[p]
spt



