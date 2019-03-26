library(rsm)


### Name: steepest
### Title: Steepest-ascent methods for response surfaces
### Aliases: steepest canonical.path
### Keywords: regression

### ** Examples

library(rsm)
heli.rsm = rsm (ave ~ block + SO(x1, x2, x3, x4), data = heli) 

steepest(heli.rsm)

canonical.path(heli.rsm)



