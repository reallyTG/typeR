library(LICORS)


### Name: setup_LC_geometry
### Title: Setup light cone geometry
### Aliases: setup_LC_geometry
### Keywords: manip

### ** Examples

aa <- setup_LC_geometry(horizon = list(PLC = 3, FLC = 1), speed = 1, space.dim = 1, 
    shape = "cone")
aa
plot(aa)
summary(aa)



