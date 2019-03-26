library(spatstat)


### Name: matchingdist
### Title: Distance for a Point Pattern Matching
### Aliases: matchingdist
### Keywords: spatial math

### ** Examples

  # an optimal matching
  X <- runifpoint(20)
  Y <- runifpoint(20)
  m.opt <- pppdist(X, Y)
  summary(m.opt)
  matchingdist(m.opt)
       # is the same as the distance given by summary(m.opt)
  
  # sequential nearest neighbour matching
  # (go through all points of point pattern X in sequence
  # and match each point with the closest point of Y that is
  # still unmatched)
  am <- matrix(0, 20, 20)
  h <- matrix(c(1:20, rep(0,20)), 20, 2)
  h[1,2] = nncross(X[1],Y)[1,2]
  for (i in 2:20) {
    nn <- nncross(X[i],Y[-h[1:(i-1),2]])[1,2]
    h[i,2] <- ((1:20)[-h[1:(i-1),2]])[nn]
  }
  am[h] <- 1
  m.nn <- pppmatching(X, Y, am)
  matchingdist(m.nn, type="spa", cutoff=1, q=1)
       # is >= the distance obtained for m.opt
       # in most cases strictly >

  opa <- par(mfrow=c(1,2))
  plot(m.opt, main="optimal")
  plot(m.nn,  main="nearest neighbour")
  text(X, 1:20, pos=1, offset=0.3, cex=0.8)
  par(opa)



