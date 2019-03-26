library(proj4)


### Name: transform
### Title: Transform geographic coordinates from one projection into
###   another
### Aliases: ptransform
### Keywords: spatial

### ** Examples

data(state)
sc <- cbind(state.center$x, state.center$y)
## this is essentially the same as project except
## that the default lat/long input is in radians
tr <- ptransform(sc/180*pi, '+proj=latlong +ellps=sphere',
                 '+proj=merc +ellps=sphere')
## we can compare it with the project result
res <- project(sc, c(proj="merc"))
## ptransform has z coordinate which is 0 for this projection
summary(tr - cbind(res, 0))



