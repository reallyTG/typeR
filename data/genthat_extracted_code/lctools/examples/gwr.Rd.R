library(lctools)


### Name: gwr
### Title: Geographically Weighted Regression (GWR)
### Aliases: gwr
### Keywords: GWR local regression

### ** Examples

data(GR.Municipalities)
Coords<-cbind(GR.Municipalities@data$X, GR.Municipalities@data$Y)
local.model<-gwr(Income01 ~ UnemrT01, GR.Municipalities@data, 50, kernel = 'adaptive', Coords)



