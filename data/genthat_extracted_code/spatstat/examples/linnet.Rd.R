library(spatstat)


### Name: linnet
### Title: Create a Linear Network
### Aliases: linnet
### Keywords: spatial

### ** Examples

  # letter 'A' specified by adjacency matrix
  v <- ppp(x=(-2):2, y=3*c(0,1,2,1,0), c(-3,3), c(-1,7))
  m <- matrix(FALSE, 5,5)
  for(i in 1:4) m[i,i+1] <- TRUE
  m[2,4] <- TRUE
  m <- m | t(m)
  letterA <- linnet(v, m)
  plot(letterA)

  # letter 'A' specified by edge list
  edg <- cbind(1:4, 2:5)
  edg <- rbind(edg, c(2,4))
  letterA <- linnet(v, edges=edg)



