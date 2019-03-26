library(LICORS)


### Name: LC-utils
### Title: Utilities for LC class
### Aliases: LC_coordinates2control_settings LC-utils plot.LC summary.LC
### Keywords: hplot method models print

### ** Examples

aa <- setup_LC_geometry(horizon = list(PLC = 2, FLC = 1), speed = 1, space.dim = 1, 
    shape = "cone")
plot(aa)
bb <- setup_LC_geometry(horizon = list(PLC = 2, FLC = 1), speed = 1, space.dim = 1, 
    shape = "revcone")
plot(bb)
aa <- setup_LC_geometry(horizon = list(PLC = 2, FLC = 0), speed = 1, space.dim = 1, 
    shape = "cone")
summary(aa)
aa <- setup_LC_geometry(horizon = list(PLC = 2, FLC = 0), speed = 1, space.dim = 1, 
    shape = "cone")
LC_coordinates2control_settings(aa$coordinates)



