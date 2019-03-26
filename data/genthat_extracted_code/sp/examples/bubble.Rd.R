library(sp)


### Name: bubble
### Title: Create a bubble plot of spatial data
### Aliases: bubble
### Keywords: dplot

### ** Examples

data(meuse)
coordinates(meuse) <- c("x", "y") # promote to SpatialPointsDataFrame
bubble(meuse, "cadmium", maxsize = 2.5, main = "cadmium concentrations (ppm)", 
    key.entries = 2^(-1:4))
bubble(meuse, "zinc", main = "zinc concentrations (ppm)",
    key.entries =  100 * 2^(0:4))



