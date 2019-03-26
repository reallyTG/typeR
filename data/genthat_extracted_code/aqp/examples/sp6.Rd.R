library(aqp)


### Name: sp6
### Title: Soil Physical and Chemical Data from Manganiferous Soils
### Aliases: sp6
### Keywords: datasets

### ** Examples

  # setup environment
  library(aqp)
  data(sp6)
  
  # init SPC
  depths(sp6) <- id ~ top + bottom
  # convert non-standard Munsell colors
  sp6$soil_color <- getClosestMunsellChip(sp6$color)
  
  # profile sketches
  par(mar=c(0,0,3,0))
  plot(sp6, color='soil_color')
  plot(sp6, color='Mn')
  plot(sp6, color='Fe')
  plot(sp6, color='pH')
  plot(sp6, color='texture')




