library(spatstat)


### Name: linearpcfcross.inhom
### Title: Inhomogeneous Multitype Pair Correlation Function (Cross-type)
###   for Linear Point Pattern
### Aliases: linearpcfcross.inhom
### Keywords: spatial nonparametric

### ** Examples

   lam <- table(marks(chicago))/(summary(chicago)$totlength)
   lamI <- function(x,y,const=lam[["assault"]]){ rep(const, length(x)) }
   lamJ <- function(x,y,const=lam[["robbery"]]){ rep(const, length(x)) }

   g <- linearpcfcross.inhom(chicago, "assault", "robbery", lamI, lamJ)

   ## Not run: 
##D      fit <- lppm(chicago, ~marks + x)
##D      linearpcfcross.inhom(chicago, "assault", "robbery", fit, fit)
##D    
## End(Not run)



