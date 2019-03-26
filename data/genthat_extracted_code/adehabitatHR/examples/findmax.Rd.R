library(adehabitatHR)


### Name: findmax
### Title: Find Local Maxima on a Map of Class 'SpatialPixelsDataFrame'
### Aliases: findmax
### Keywords: spatial

### ** Examples


data(puechabonsp)

## estimates the UD
kud <- kernelUD(puechabonsp$relocs[,1])

## displays the maximum
image(kud[[1]])
points(findmax(kud[[1]]))




