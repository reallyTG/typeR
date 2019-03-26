library(spData)


### Name: world
### Title: World country polygons
### Aliases: world wrld
### Keywords: datasets sf

### ** Examples

if (requireNamespace("sf", quietly = TRUE)) {
  library(sf)
  data(world)
  # or
  world <- st_read(system.file("shapes/world.gpkg", package="spData"))

  plot(world)
}



