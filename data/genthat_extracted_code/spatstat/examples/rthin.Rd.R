library(spatstat)


### Name: rthin
### Title: Random Thinning
### Aliases: rthin
### Keywords: spatial datagen

### ** Examples

  plot(redwood, main="thinning")
  
  # delete 20% of points
  Y <- rthin(redwood, 0.8)
  points(Y, col="green", cex=1.4)

  # function
  f <- function(x,y) { ifelse(x < 0.4, 1, 0.5) }
  Y <- rthin(redwood, f)

  # pixel image
  Z <- as.im(f, Window(redwood))
  Y <- rthin(redwood, Z)

  # pattern on a linear network
  A <- runiflpp(30, simplenet)
  B <- rthin(A, 0.2)
  g <- function(x,y,seg,tp) { ifelse(y < 0.4, 1, 0.5) }
  B <- rthin(A, linfun(g, simplenet))



