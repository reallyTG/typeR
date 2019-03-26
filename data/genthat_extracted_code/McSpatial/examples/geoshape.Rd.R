library(McSpatial)


### Name: geoshape
### Title: Calculates distances between a shape file and a set of points.
### Aliases: geoshape
### Keywords: Distance Maps

### ** Examples

data(matchdata)
cmap <- readShapePoly(system.file("maps/CookCensusTracts.shp",
  package="McSpatial"))
cmap <- cmap[cmap$CHICAGO==1,]
lmat <- coordinates(cmap)
# Calculate distance between homes in matchdata and the census tract centroids
matchdata$dist1 <- geoshape(matchdata$longitude,matchdata$latitude,pointfile=cmap)
# Alternative method using coormatrix option
matchdata$dist2 <- geoshape(matchdata$longitude,matchdata$latitude,
  coormatrix=coordinates(cmap))

# measure distance from census tract centroids to Chicago city center
longitude <- lmat[,1]
latitude  <- lmat[,2]
cmat <- t(as.matrix(c(-87.627800, 41.881998)))
dcbd <- geoshape(longitude, latitude, coormatrix=cmat)
summary(dcbd)





