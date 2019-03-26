library(spatstat)


### Name: model.matrix.mppm
### Title: Extract Design Matrix of Point Process Model for Several Point
###   Patterns
### Aliases: model.matrix.mppm
### Keywords: spatial models

### ** Examples

   fit <- mppm(Points ~ Image + x, demohyper)
   head(model.matrix(fit))
   # matrix with three columns: '(Intercept)', 'x' and 'Image'



