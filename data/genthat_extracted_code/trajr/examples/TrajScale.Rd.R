library(trajr)


### Name: TrajScale
### Title: Scale a trajectory
### Aliases: TrajScale

### ** Examples

set.seed(42)
trj <- TrajGenerate()
# original trajectory units are pixels, measured as having
# 47 pixels in 10 mm, so to convert to metres, scale the
# trajectory by the approriate factor, i.e. (size in metres) / (size in pixels).
scale <- .01 / 47
scaled <- TrajScale(trj, scale, "m")




