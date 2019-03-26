library(lctools)


### Name: spGini.w
### Title: Spatial Gini coefficient with a given weights matrix
### Aliases: spGini.w
### Keywords: Gini Spatial Gini Spatial Inequality Spatial autocorrelation

### ** Examples

data(GR.Municipalities)
w<-w.matrix(cbind(GR.Municipalities@data$X, GR.Municipalities@data$Y),12,WType='Binary')
spGini.w(GR.Municipalities@data$Income01,w)



