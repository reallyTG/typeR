library(BMAmevt)


### Name: dgridplot
### Title: Image and/or Contour plots of spectral densities in trivariate
###   extreme value models
### Aliases: dgridplot

### ** Examples

wrapper <- function(x, y, my.fun,...)
      {
       sapply(seq_along(x), FUN = function(i) my.fun(x[i], y[i],...))
      }

grid <- discretize(npoints=40,eps=1e-3,equi=FALSE)

Density <- outer(grid$X,grid$Y,FUN=wrapper,
                my.fun=function(x,y){10*((x/2)^2+y^2)*((x+y)<1)})

dgridplot(density= Density,npoints=40, equi=FALSE)



