library(HSAUR3)


### Name: planets
### Title: Exoplanets Data
### Aliases: planets
### Keywords: datasets

### ** Examples


  data("planets", package = "HSAUR3")
  require("scatterplot3d")
  scatterplot3d(log(planets$mass), log(planets$period), log(planets$eccen), 
                type = "h", highlight.3d = TRUE,  angle = 55, 
                scale.y = 0.7, pch = 16)




