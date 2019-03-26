library(spatstat)


### Name: linearKdot.inhom
### Title: Inhomogeneous multitype K Function (Dot-type) for Linear Point
###   Pattern
### Aliases: linearKdot.inhom
### Keywords: spatial nonparametric

### ** Examples

   lam <- table(marks(chicago))/(summary(chicago)$totlength)
   lamI <- function(x,y,const=lam[["assault"]]){ rep(const, length(x)) }
   lam. <- function(x,y,const=sum(lam)){ rep(const, length(x)) }

   K <- linearKdot.inhom(chicago, "assault", lamI, lam.)

   ## Not run: 
##D      fit <- lppm(chicago, ~marks + x)
##D      linearKdot.inhom(chicago, "assault", fit, fit)
##D    
## End(Not run)



