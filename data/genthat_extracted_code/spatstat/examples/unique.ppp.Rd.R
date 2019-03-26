library(spatstat)


### Name: unique.ppp
### Title: Extract Unique Points from a Spatial Point Pattern
### Aliases: unique.ppp unique.ppx
### Keywords: spatial methods

### ** Examples

   X <- ppp(c(1,1,0.5), c(2,2,1), window=square(3))
   unique(X)
   unique(X, rule="deldir")



