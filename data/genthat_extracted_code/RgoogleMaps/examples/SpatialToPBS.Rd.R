library(RgoogleMaps)


### Name: SpatialToPBS
### Title: converts spatial objects as defined in package sp to simpler
###   PBSmapping type dataframes
### Aliases: SpatialToPBS

### ** Examples



  if (interactive()) {


  data("NYleukemia", envir = environment())


  population <- NYleukemia$data$population


  cases <- NYleukemia$data$cases


  mapNY <- GetMap(center=c(lat=42.67456,lon=-76.00365), 


                  destfile = file.path(tempdir(),"NYstate.png"), 


                  maptype = "mobile", zoom=9)


  #mapNY=ReadMapTile("NYstate.png")


  clrStuff=ColorMap(100*cases/population, alpha = 0.35, log = TRUE)


  NYpolys = SpatialToPBS(NYleukemia$spatial.polygon)


  PlotPolysOnStaticMap(mapNY, NYpolys$xy, col = clrStuff$colcode, add = FALSE)


  legend("topleft", legend = clrStuff$legend, fill = clrStuff$fill, 


         bg = rgb(0.1,0.1,0.1,0.3))


}


  





