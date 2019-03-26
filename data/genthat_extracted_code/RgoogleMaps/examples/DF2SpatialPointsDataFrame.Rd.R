library(RgoogleMaps)


### Name: DF2SpatialPointsDataFrame
### Title: change data.frame to SpatialPointsDataFrame
### Aliases: DF2SpatialPointsDataFrame

### ** Examples



if (requireNamespace("sp", quietly = TRUE)) {


  data("meuse", package = "sp", envir = environment())


  meuseSP = DF2SpatialPointsDataFrame(meuse)


  


  sp::plot(meuseSP, asp = 1, cex = 4 * meuse$zinc/max(meuse$zinc),


       pch = 1, col = as.numeric(meuse$ffreq)+1 )


  data("meuse.riv", package = "sp", envir = environment())


  lines(meuse.riv)  


} else {


  print("package sp must be installed for this example")


}











