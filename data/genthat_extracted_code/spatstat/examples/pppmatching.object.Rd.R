library(spatstat)


### Name: pppmatching.object
### Title: Class of Point Matchings
### Aliases: pppmatching.object
### Keywords: spatial attribute

### ** Examples

  # a random complete unweighted matching
  X <- runifpoint(10)
  Y <- runifpoint(10)
  am <- r2dtable(1, rep(1,10), rep(1,10))[[1]]
        # generates a random permutation matrix
  m <- pppmatching(X, Y, am)
  summary(m)
  m$matrix
  ## Not run: 
##D     plot(m)
##D   
## End(Not run)

  # an optimal complete unweighted matching
  m2 <- pppdist(X,Y)
  summary(m2)
  m2$matrix
  ## Not run: 
##D     plot(m2)
##D   
## End(Not run)



