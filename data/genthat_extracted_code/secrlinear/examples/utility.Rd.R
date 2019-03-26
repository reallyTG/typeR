library(secrlinear)


### Name: utility
### Title: Utility Functions
### Aliases: make.sldf snapPointsToLinearMask asgraph getLineID
### Keywords: manip

### ** Examples


## test make.sldf()

coord <- data.frame(x = c(1,2,3,1.05,2.05,3.05),
    y = c(3,2,2,3.05,2.05,2.05))

sldf1 <- make.sldf(coord)
sldf2 <- make.sldf(coord, f = c(1,1,1,2,2,2))

if (require('sp')) {
  plot(sldf1)
  plot(sldf2)
}

## test snapPointsToLinearMask()

## Not run: 
##D 
##D x <- seq(0, 4*pi, length = 200)
##D xy <- data.frame(x = x*100, y = sin(x)*300)
##D mask <- read.linearmask(data = xy, spacing = 20)
##D plot(mask)
##D ## click several points, right-click and select 'stop'
##D pts <- locator()
##D pts <- do.call(cbind, pts)
##D points(pts)
##D pts1 <- snapPointsToLinearMask(pts, mask)
##D segments(pts[,1], pts[,2], pts1[,1], pts1[,2])
##D points(pts1, pch = 16, col = 'red')
##D df <- data.frame(pts, pts1)
##D names(df) <- c('from.x', 'from.y', 'to.x', 'to.y')
##D df
##D 
## End(Not run)

## asgraph (called by networkdistance)
## see 'igraph' for further manipulation
grmask <- asgraph(glymemask)
if (require('igraph')) {
  summary(grmask)
}




