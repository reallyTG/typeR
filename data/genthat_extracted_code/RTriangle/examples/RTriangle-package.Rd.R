library(RTriangle)


### Name: RTriangle-package
### Title: Generate 2D Quality meshes and constrained Delaunay
###   triangulations
### Aliases: RTriangle-package RTriangle
### Keywords: package

### ** Examples

## Create an object with a concavity
p <- pslg(P=rbind(c(0, 0), c(0, 1), c(0.5, 0.5), c(1, 1), c(1, 0)),
          S=rbind(c(1, 2), c(2, 3), c(3, 4), c(4, 5), c(5, 1)))
## Plot it
plot(p)
## Triangulate it
tp <- triangulate(p)
plot(tp)
## Triangulate it subject to minimum area constraint
tp <- triangulate(p, a=0.01)
plot(tp)
## Load a data set containing a hole
A <- read.pslg(file.path(system.file(package = "RTriangle"), "extdata", "A.poly"))
plot(A)
## Triangulate the PSLG
tA <- triangulate(A)
plot(tA)
## Triangulate the PSLG with triangles in which no angle
## is smaller than 20 degrees
tA <- triangulate(A, q=20)
plot(tA)
## Triangulate the PSLG with triangles in which no triangle has 
## area greater than 0.001
tA <- triangulate(A, a=0.001)
plot(tA)



