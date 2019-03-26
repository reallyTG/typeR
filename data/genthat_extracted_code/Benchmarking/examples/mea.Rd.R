library(Benchmarking)


### Name: mea
### Title: MEA multi-directional efficiency analysis
### Aliases: mea mea.lines
### Keywords: models efficiency

### ** Examples

X <- matrix(c(2, 2, 5, 10, 10, 3,    12, 8, 5, 4, 6,12), ncol=2)
Y <- matrix(rep(1,dim(X)[1]), ncol=1)

dea.plot.isoquant(X[,1], X[,2],txt=1:dim(X)[1])
mea.lines(c(5,6),X,Y)

me <- mea(X,Y)
me
peers(me)
# MEA potential saving in inputs, exces inputs
eff(me) * me$direct
me$eff *  me$direct

# Compare to traditionally Farrell efficiency
e <- dea(X,Y)
e
peers(e)
# Farrell potential saving in inputs, exces inputs
(1-eff(e)) * X



