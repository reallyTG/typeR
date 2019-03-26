library(spatstat)


### Name: linearpcfdot.inhom
### Title: Inhomogeneous Multitype Pair Correlation Function (Dot-type) for
###   Linear Point Pattern
### Aliases: linearpcfdot.inhom
### Keywords: spatial nonparametric

### ** Examples

   lam <- table(marks(chicago))/(summary(chicago)$totlength)
   lamI <- function(x,y,const=lam[["assault"]]){ rep(const, length(x)) }
   lam. <- function(x,y,const=sum(lam)){ rep(const, length(x)) }

   g <- linearpcfdot.inhom(chicago, "assault", lamI, lam.)

   ## Not run: 
##D      fit <- lppm(chicago, ~marks + x)
##D      linearpcfdot.inhom(chicago, "assault", fit, fit)
##D    
## End(Not run)



