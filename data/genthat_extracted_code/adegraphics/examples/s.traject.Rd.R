library(adegraphics)


### Name: s.traject
### Title: 2-D scatter plot with trajectories
### Aliases: s.traject
### Keywords: hplot aplot

### ** Examples

rw <- function(a) {
  x <- 0
  for(i in 1:49) x <- c(x, x[length(x)] + runif(1, -1, 1))
  x
}
x1 <- unlist(lapply(1:5, rw), use.names = FALSE)
y1 <- unlist(lapply(1:5, rw), use.names = FALSE)
z1 <- gl(5, 50)
g1 <- s.traject(data.frame(x1, y1), z1, ppoints.pch = 19:23, plines.col = rainbow(5))

x2 <- unlist(lapply(1:2, rw), use.names = FALSE)
y2 <- unlist(lapply(1:2, rw), use.names = FALSE)
z2 <- gl(2, 50)
g2 <- s.traject(data.frame(x2, y2), z2, ppoints.pch = 21:20, plines.col = 1:2)



