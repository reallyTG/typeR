library(HSAUR)


### Name: water
### Title: Mortality and Water Hardness
### Aliases: water
### Keywords: datasets

### ** Examples


  data("water", package = "HSAUR")
  plot(mortality ~ hardness, data = water, 
       col = as.numeric(water$location))




