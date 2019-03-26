library(lctools)


### Name: spGini
### Title: Spatial Gini coefficient
### Aliases: spGini
### Keywords: Gini Spatial Gini Spatial Inequality Spatial autocorrelation

### ** Examples

data(GR.Municipalities)
Coords1<-cbind(GR.Municipalities@data$X, GR.Municipalities@data$Y)
Bandwidth1<-12
x1<-GR.Municipalities@data$Income01
WType1<-'Binary'
spGini(Coords1,Bandwidth1,x1,WType1)



