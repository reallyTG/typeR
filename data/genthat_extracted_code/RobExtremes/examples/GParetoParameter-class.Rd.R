library(RobExtremes)


### Name: GParetoParameter-class
### Title: Parameter of generalized Pareto distributions
### Aliases: GParetoParameter-class loc,GParetoParameter-method
###   loc<-,GParetoParameter-method location,GParetoParameter-method
###   location<-,GParetoParameter-method scale,GParetoParameter-method
###   scale<-,GParetoParameter-method shape,GParetoParameter-method
###   shape<-,GParetoParameter-method
### Keywords: distribution models

### ** Examples

P <- new("GParetoParameter")
loc(P)
## same as
location(P)
scale(P)
shape(P)

scale(P) <- 2
loc(P) <- -5
shape(P) <- -1 # may be negative
P



