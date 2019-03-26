library(latticeExtra)


### Name: tileplot
### Title: Plot a spatial mosaic from irregular 2D points
### Aliases: tileplot
### Keywords: hplot

### ** Examples

xyz <- data.frame(x = rnorm(100), y = rnorm(100), z = rnorm(100))
tileplot(z ~ x * y, xyz)

## tripack is faster but non-free
## Not run: 
##D tileplot(z ~ x * y, xyz, use.tripack = TRUE)
## End(Not run)

## showing rectangular window boundary
tileplot(z ~ x * y, xyz, xlim = c(-2, 4), ylim = c(-2, 4))

## insert some missing values
xyz$z[1:10] <- NA
## the default na.rm = FALSE shows missing polygons
tileplot(z ~ x * y, xyz, border = "black",
  col.regions = grey.colors(100),
  pch = ifelse(is.na(xyz$z), 4, 21),
  panel = function(...) {
    panel.fill("hotpink")
    panel.voronoi(...)
  })
## use na.rm = TRUE to ignore points with missing values
update(trellis.last.object(), na.rm = TRUE)

## a quick and dirty approximation to US state boundaries
tmp <- state.center
tmp$Income <- state.x77[,"Income"]
tileplot(Income ~ x * y, tmp, border = "black",
  panel = function(x, y, ...) {
    panel.voronoi(x, y, ..., points = FALSE)
    panel.text(x, y, state.abb, cex = 0.6)
  })



