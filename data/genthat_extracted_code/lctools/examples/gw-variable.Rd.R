library(lctools)


### Name: gw_variable
### Title: Spatial Interaction Models: gw / regional variable
### Aliases: gw_variable
### Keywords: regional variable geographically weighted variable

### ** Examples

data(GR.Municipalities)
GrCoords<-cbind(GR.Municipalities@data$X[1:100], GR.Municipalities@data$Y[1:100])
Regional_Population <-gw_variable(GrCoords,GR.Municipalities@data$PopTot01[1:100])



