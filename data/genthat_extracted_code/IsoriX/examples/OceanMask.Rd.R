library(IsoriX)


### Name: OceanMask
### Title: Mask of world oceans
### Aliases: OceanMask
### Keywords: datasets

### ** Examples


if(require(sp)) {
  plot(OceanMask, col='blue')
}

## How did we create this file?

## Uncomment the following to create the file as we did
#if(require(raster) & require(rgeos)){
#    worldlimit <- as(extent(CountryBorders), "SpatialPolygons")
#    proj4string(worldlimit) <- crs(CountryBorders)
#    OceanMask <- gDifference(worldlimit, CountryBorders)  
#    OceanMask
#    save(OceanMask, file = "OceanMask.rda", compress = "xz")
#}





