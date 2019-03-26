library(fpc)


### Name: con.comp
### Title: Connectivity components of an undirected graph
### Aliases: con.comp
### Keywords: array cluster

### ** Examples

  set.seed(1000)
  x <- rnorm(20)
  m <- matrix(0,nrow=20,ncol=20)
  for(i in 1:20)
    for(j in 1:20)
      m[i,j] <- abs(x[i]-x[j])
  d <- m<0.2
  cc <- con.comp(d)
  max(cc) # number of connectivity components
  plot(x,cc)
  # The same should be produced by
  # cutree(hclust(as.dist(m),method="single"),h=0.2).



