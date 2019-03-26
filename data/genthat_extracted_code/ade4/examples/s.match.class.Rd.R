library(ade4)


### Name: s.match.class
### Title: Scatterplot of two sets of coordinates and a partionning into
###   classes
### Aliases: s.match.class
### Keywords: multivariate hplot

### ** Examples

xy <- data.frame(matrix(rnorm(100), 50, 2))
xy[, 1] <- xy[, 1] + rep(seq(0, 12, by = 3), rep(10, 5))
xy[, 2] <- xy[, 2] + rep(seq(0, 12, by = 3), rep(10, 5))
fac <- gl(5, 10)
xy2 <- xy + matrix(rnorm(100), 50, 2) + 1

if(adegraphicsLoaded()) {
  mat <- rbind(xy, xy2)
  minmat <- apply(mat, 2, min)
  maxmat <- apply(mat, 2, max)
  lag <- 0.1 * abs(minmat - maxmat)
  xli <- c(minmat[1] - lag[1], maxmat[1] + lag[1])
  yli <- c(minmat[2] - lag[2], maxmat[2] + lag[2])
  
  g1 <- s.class(xy, fac, ellipseSize = 0, col = rep("grey45", nlevels(fac)), xlim = xli, 
    ylim = yli, plabels.cex = 0, plot = FALSE)
  g2 <- s.class(xy2, fac, ellipseSize = 0, col = rep("grey75", nlevels(fac)), xlim = xli, 
    ylim = yli, plabels.cex = 0, plot = FALSE)
  g3 <- s.match(g1@stats$means, g2@stats$means, xlim = xli, ylim = yli, plines.lwd = 2, 
    psub.text = "xy -> xy2", plot = FALSE)
  
  g4 <- do.call("superpose", list(g1, g2))
  g4@Call <- call("superpose", g1@Call, g2@Call)
  g4 <- do.call("superpose", list(g4, g3))
  g4@Call <- call("superpose", g4@Call, g3@Call)
  g4
  
} else {
  s.match.class(xy, xy2, fac)
}



