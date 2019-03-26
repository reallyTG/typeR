library(spatstat)


### Name: lpp
### Title: Create Point Pattern on Linear Network
### Aliases: lpp
### Keywords: spatial

### ** Examples

  # letter 'A' 
  v <- ppp(x=(-2):2, y=3*c(0,1,2,1,0), c(-3,3), c(-1,7))
  edg <- cbind(1:4, 2:5)
  edg <- rbind(edg, c(2,4))
  letterA <- linnet(v, edges=edg)

  # points on letter A
  xx <- list(x=c(-1.5,0,0.5,1.5), y=c(1.5,3,4.5,1.5))
  X <- lpp(xx, letterA)

  plot(X)
  X
  summary(X)

  # empty pattern
  lpp(L=letterA)



