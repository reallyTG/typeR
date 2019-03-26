library(RobExtremes)


### Name: GEVParameter-class
### Title: Parameter of generalized Pareto distributions
### Aliases: GEVParameter-class loc,GEVParameter-method
###   loc<-,GEVParameter-method location,GEVParameter-method
###   location<-,GEVParameter-method scale,GEVParameter-method
###   scale<-,GEVParameter-method shape,GEVParameter-method
###   shape<-,GEVParameter-method
### Keywords: distribution models

### ** Examples

P <- new("GEVParameter")
loc(P)
## same as
location(P)
scale(P)
shape(P)

scale(P) <- 2
location(P) <- 4
shape(P) <- -1 # may be negative!
P



