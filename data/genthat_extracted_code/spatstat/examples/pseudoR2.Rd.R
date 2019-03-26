library(spatstat)


### Name: pseudoR2
### Title: Calculate Pseudo-R-Squared for Point Process Model
### Aliases: pseudoR2 pseudoR2.ppm pseudoR2.lppm
### Keywords: spatial models

### ** Examples

  fit <- ppm(swedishpines ~ x+y)
  pseudoR2(fit)

  xcoord <- as.im(function(x,y) x, Window(swedishpines))
  fut <- ppm(swedishpines ~ offset(xcoord/200) + y)
  pseudoR2(fut)



