library(meteo)


### Name: tiling
### Title: Tiling raster or Spatial-class Grid or Pixels object
### Aliases: tiling

### ** Examples

data(regdata) 
str(regdata@sp) # DEM and TWI data for Serbia at 1 km resolution
dem=regdata@sp['dem']
library(sp)
spplot(dem,  col.regions=bpy.colors() )

str(dem)
# tiling dem in tiles 250x250 with 25 cells overlap
tiles = tiling(dem,tilesize=250,overlapping=25,aspoints=TRUE)
# number of tiles
length(tiles)

image(dem)
points(tiles[[1]] , pch='-' ,col ='green')
points(tiles[[2]], pch='.')

str(tiles[[1]])




