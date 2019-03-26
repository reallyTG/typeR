library(meteoland)


### Name: SpatialPixelsTopography
### Title: Creates a 'SpatialPixelsTopography'
### Aliases: SpatialPixelsTopography

### ** Examples

data(examplegridtopography)

#Creates spatial topography pixels as a subset of points in the grid
spt = as(examplegridtopography,"SpatialPointsTopography")
cc = spt@coords
center = 5160
d = sqrt((cc[,1]-cc[center,1])^2+(cc[,2]-cc[center,2])^2)
p = which(d<3000) #Select points at maximum distance of 3km from center
spxt = SpatialPixelsTopography(spt[p], spt$elevation[p],
                              spt$slope[p],
                              spt$aspect[p])

#Alternatively, use coercing and subsetting (drop = TRUE causes grid to be recalculated) 
spxt = as(examplegridtopography, "SpatialPixelsTopography")[p, drop=TRUE]          
                              
#Display data
spplot(spxt, variable="elevation", scales=list(draw=TRUE))
spplot(spxt, variable="slope", scales=list(draw=TRUE))
spplot(spxt, variable="aspect", scales=list(draw=TRUE))



