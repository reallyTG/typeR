library(lctools)


### Name: moransI.v
### Title: Computes a vector of Moran's I statistics.
### Aliases: moransI.v
### Keywords: Moran's I Moran's I significance test Spatial autocorrelation

### ** Examples

data(GR.Municipalities)
Coords<-cbind(GR.Municipalities@data$X, GR.Municipalities@data$Y)

#using an adaptive kernel
bws <- c(3, 4, 6, 9, 12, 18, 24)
moransI.v(Coords, bws, GR.Municipalities@data$Income01)



