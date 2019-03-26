library(spacom)


### Name: WeightMatrix
### Title: Create spatial weighting matrices
### Aliases: WeightMatrix
### Keywords: spacom spatial

### ** Examples

# creating geographical proximity weight, with bandwidth h=50

data(d_geo) 
geow_50 <- WeightMatrix(distance.matrix=d_geo, bandwidth=50)



