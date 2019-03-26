library(spatstat)


### Name: multiplicity.ppp
### Title: Count Multiplicity of Duplicate Points
### Aliases: multiplicity multiplicity.default multiplicity.data.frame
###   multiplicity.ppp multiplicity.ppx
### Keywords: spatial utilities

### ** Examples

   X <- ppp(c(1,1,0.5,1), c(2,2,1,2), window=square(3), check=FALSE)
   m <- multiplicity(X)

   # unique points in X, marked by their multiplicity
   first <- !duplicated(X)
   Y <- X[first] %mark% m[first]



