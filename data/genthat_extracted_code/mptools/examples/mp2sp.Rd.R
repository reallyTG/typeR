library(mptools)


### Name: mp2sp
### Title: Create a SpatialPointsDataFrame describing Metapop population
###   centroids
### Aliases: mp2sp
### Keywords: spatial

### ** Examples

mp <- system.file('example.mp', package='mptools')
r <- system.file('example_001.tif', package='mptools')
coords <- mp2xy(mp, r, 9.975)
spdf <- mp2sp(mp, coords, start=2000)
spdf



