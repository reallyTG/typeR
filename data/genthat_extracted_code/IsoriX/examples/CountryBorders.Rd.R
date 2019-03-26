library(IsoriX)


### Name: CountryBorders
### Title: Borders of world CountryBorders
### Aliases: CountryBorders
### Keywords: datasets

### ** Examples


if(require(sp))
  plot(CountryBorders, border="red", col="darkgrey")

## How did we create this file?

## Uncomment the following to create the file as we did
#if(require(maps) & require(maptools) & require(rgeos)){
#    worldmap <- map("world", fill = TRUE, plot = FALSE)
#    CountryBorders <- map2SpatialPolygons(worldmap, IDs = worldmap$names)
#    CountryBorders <- gBuffer(CountryBorders, byid = TRUE, width = 0)
#    proj4string(CountryBorders) <- CRS("+proj=longlat +datum=WGS84")
#    CountryBorders
#    save(CountryBorders, file = "CountryBorders.rda", compress = "xz")
#}




