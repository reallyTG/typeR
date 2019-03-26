library(RobExtremes)


### Name: GEV-class
### Title: Generalized EV distribution
### Aliases: GEV-class initialize,GEV-method loc,GEV-method
###   loc<-,GEV-method location,GEV-method location<-,GEV-method
###   scale,GEV-method scale<-,GEV-method shape,GEV-method
###   shape<-,GEV-method +,GEV,numeric-method *,GEV,numeric-method
### Keywords: distribution

### ** Examples

(P1 <- new("GEV", loc = 0, scale = 1,shape = 0))
plot(P1)
shape(P1)
loc(P1)
scale(P1) <- 4
loc(P1) <- 2
shape(P1) <- -1 # may be negative!
plot(P1)



