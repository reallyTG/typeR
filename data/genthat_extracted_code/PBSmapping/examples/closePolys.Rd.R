library(PBSmapping)


### Name: closePolys
### Title: Close a PolySet
### Aliases: closePolys
### Keywords: manip

### ** Examples

local(envir=.PBSmapEnv,expr={
  oldpar = par(no.readonly=TRUE)
  #--- 4 corners
  polys <- data.frame(
    PID = c(1, 1, 2, 2, 3, 3, 4, 4),
    POS = c(1, 2, 1, 2, 1, 2, 1, 2),
    X   = c(0, 1, 2, 3, 0, 1, 2, 3),
    Y   = c(1, 0, 0, 1, 2, 3, 3, 2))
  plotPolys(closePolys(polys), col=2)

  #--- 2 corners and 1 opposite
  polys <- data.frame(
    PID = c(1, 1, 2, 2, 3, 3, 3),
    POS = c(1, 2, 1, 2, 1, 2, 3),
    X   = c(0, 1, 0, 1, 5, 6, 1.5),
    Y   = c(1, 0, 2, 3, 0, 1.5, 3))
  plotPolys(closePolys(polys), col=2)
  par(oldpar)
})



