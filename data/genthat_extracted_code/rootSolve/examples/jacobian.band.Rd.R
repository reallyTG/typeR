library(rootSolve)


### Name: jacobian.band
### Title: Banded jacobian matrix for a system of ODEs (ordinary
###   differential equations)
### Aliases: jacobian.band
### Keywords: math

### ** Examples

## =======================================================================

mod <- function (t = 0, y, parms = NULL,...) {
  dy1 <-  y[1] + 2*y[2]
  dy2 <-3*y[1] + 4*y[2] + 5*y[3]
  dy3 <-         6*y[2] + 7*y[3] + 8*y[4]
  dy4 <-                  9*y[3] +10*y[4]
  return(as.list(c(dy1, dy2, dy3, dy4)))
}

jacobian.band(y = c(1, 2, 3, 4), func = mod)



