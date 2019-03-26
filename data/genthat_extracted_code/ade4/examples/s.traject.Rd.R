library(ade4)


### Name: s.traject
### Title: Trajectory Plot
### Aliases: s.traject
### Keywords: multivariate hplot

### ** Examples

if(!adegraphicsLoaded()) {
  rw <- function(a) {
    x <- 0
    for(i in 1:49) x <- c(x, x[length(x)] + runif(1, -1, 1))
    x
  }
  y <- unlist(lapply(1:5, rw))
  x <- unlist(lapply(1:5, rw))
  z <- gl(5, 50)
  s.traject(data.frame(x, y), z, edge = FALSE)
}


