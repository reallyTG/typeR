library(HSAUR2)


### Name: water
### Title: Mortality and Water Hardness
### Aliases: water
### Keywords: datasets

### ** Examples


  data("water", package = "HSAUR2")
  plot(mortality ~ hardness, data = water, 
       col = as.numeric(water$location))




