library(lctools)


### Name: w.matrix
### Title: Weights Matrix based on a number of nearest neighbours or a
###   fixed distance
### Aliases: w.matrix
### Keywords: Spatial Analysis Weights Matrix

### ** Examples

data(GR.Municipalities)
attr <- GR.Municipalities@data

#adaptive kernel
w.adapt <- w.matrix(cbind(attr$X, attr$Y),6, WType='Binary', family='adaptive')

#fixed kernel
w.fixed <- w.matrix(cbind(attr$X, attr$Y), 50000, WType='Binary', family='fixed')




