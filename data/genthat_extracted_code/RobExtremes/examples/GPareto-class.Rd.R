library(RobExtremes)


### Name: GPareto-class
### Title: Generalized Pareto distribution
### Aliases: GPareto-class initialize,GPareto-method loc,GPareto-method
###   loc<-,GPareto-method location,GPareto-method
###   location<-,GPareto-method scale,GPareto-method scale<-,GPareto-method
###   shape,GPareto-method shape<-,GPareto-method +,GPareto,numeric-method
###   *,GPareto,numeric-method
### Keywords: distribution

### ** Examples

(P1 <- new("GPareto", loc = 0, scale = 1,shape = 0))
plot(P1)
shape(P1)
loc(P1)
scale(P1) <- 4
location(P1) <- 2 ## same as loc(P1) <- 2
shape(P1) <- -2 # may be negative
plot(P1)



