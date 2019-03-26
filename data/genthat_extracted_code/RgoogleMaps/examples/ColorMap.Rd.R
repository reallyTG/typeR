library(RgoogleMaps)


### Name: ColorMap
### Title: Plot Levels of a Variable in a Colour-Coded Map
### Aliases: ColorMap

### ** Examples



  if (interactive()){


  data("NYleukemia", envir = environment())


  population <- NYleukemia$data$population


  cases <- NYleukemia$data$cases


  mapNY <- GetMap(center=c(lat=42.67456,lon=-76.00365), destfile = "NYstate.png", 


                  maptype = "mobile", zoom=9)


  ColorMap(100*cases/population, mapNY, NYleukemia$spatial.polygon, add = FALSE,


           alpha = 0.35, log = TRUE, location = "topleft")


}


  #ColorMap(100*cases/population, map=NULL, NYleukemia$spatial.polygon)


  





