library(dave)


### Name: dircor
### Title: Directional mantel correlation
### Aliases: dircor dircor2 dircor.default plot.dircor
### Keywords: models multivariate

### ** Examples

# vegetation data is taken from sveg
# the x- and y-axes are stored in object ssit
o.dircor<- dircor(sveg,ssit$x.axis,ssit$y.axis,step=40)
plot(o.dircor)



