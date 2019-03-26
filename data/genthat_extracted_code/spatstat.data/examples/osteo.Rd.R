library(spatstat.data)


### Name: osteo
### Title: Osteocyte Lacunae Data: Replicated Three-Dimensional Point
###   Patterns
### Aliases: osteo
### Keywords: datasets

### ** Examples

  data(osteo)
  if(require(spatstat)) {
  osteo
  if(interactive()) {
    plot(osteo$pts[[1]], main="animal 1, brick 1")
    ape1 <- osteo[osteo$shortid==4, ]
    plot(ape1, tick.marks=FALSE)
    with(osteo, intensity(pts))
    plot(with(ape1, K3est(pts)))
  }
  }



