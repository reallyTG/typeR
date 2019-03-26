library(RgoogleMaps)


### Name: RGB2GRAY
### Title: translates an RGB image matrix to gray scale
### Aliases: RGB2GRAY

### ** Examples



if (interactive()){


  BrooklynLatLon = getGeoCode("Brooklyn")


  mapBrooklyn <- GetMap(center=BrooklynLatLon, destfile = file.path(tempdir(), "Brooklyn.png"), 


                 zoom=11, size = c(240,240))


  mapBrooklynBW$myTile = RGB2GRAY(mapBrooklyn$myTile)


  PlotOnStaticMap(mapBrooklynBW)


}





