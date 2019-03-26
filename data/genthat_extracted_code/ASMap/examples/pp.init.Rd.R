library(ASMap)


### Name: pp.init
### Title: Parameter initialization function
### Aliases: pp.init
### Keywords: misc

### ** Examples


data(mapDH, package = "ASMap")

## pull markers from a linkage map with a segregation distortion

pars <- pp.init(seg.thresh = 0.05)
mapDH.s <- pullCross(mapDH, type = "seg.distortion", pars = pars)
mapDH.s$seg.distortion$table



