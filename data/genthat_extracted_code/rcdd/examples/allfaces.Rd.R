library(rcdd)


### Name: allfaces
### Title: All Faces of a Convex Polyhedron
### Aliases: allfaces
### Keywords: misc

### ** Examples

hrep <- rbind(c(0, 1,  1,  1, -1),
              c(0, 1,  1, -1, -1),
              c(0, 1, -1, -1, -1),
              c(0, 1, -1,  1, -1),
              c(0, 0,  0,  0,  1))

allfaces(d2q(hrep))



