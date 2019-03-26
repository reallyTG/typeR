library(maptree)


### Name: ngon
### Title: Outline or Fill a Regular Polygon
### Aliases: ngon
### Keywords: aplot

### ** Examples

  plot (c(0,1), c(0,1), type="n")
  ngon (c(.5, .5, 10, "blue"), angle=30, n=3)
  apply (cbind (runif(8), runif(8), 6, 2), 1, ngon)



