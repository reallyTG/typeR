library(spatstat)


### Name: pppmatching
### Title: Create a Point Matching
### Aliases: pppmatching
### Keywords: spatial datagen

### ** Examples

  # a random unweighted complete matching
  X <- runifpoint(10)
  Y <- runifpoint(10)
  am <- r2dtable(1, rep(1,10), rep(1,10))[[1]]
        # generates a random permutation matrix
  m <- pppmatching(X, Y, am)
  summary(m)
  m$matrix
  plot(m)

  # a random weighted complete matching
  X <- runifpoint(7)
  Y <- runifpoint(7)
  am <- r2dtable(1, rep(10,7), rep(10,7))[[1]]/10
        # generates a random doubly stochastic matrix
  m2 <- pppmatching(X, Y, am)
  summary(m2)
  m2$matrix
  plot(m2)
  m3 <- pppmatching(X, Y, am, "ace")
  m4 <- pppmatching(X, Y, am, "mat")



