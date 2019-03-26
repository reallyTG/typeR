library(spatstat)


### Name: duplicated.ppp
### Title: Determine Duplicated Points in a Spatial Point Pattern
### Aliases: duplicated.ppp duplicated.ppx anyDuplicated.ppp
###   anyDuplicated.ppx
### Keywords: spatial methods

### ** Examples

   X <- ppp(c(1,1,0.5), c(2,2,1), window=square(3))
   duplicated(X)
   duplicated(X, rule="deldir")



