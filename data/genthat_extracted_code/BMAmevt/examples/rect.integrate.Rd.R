library(BMAmevt)


### Name: rect.integrate
### Title: Density integration on the two-dimensional simplex
### Aliases: rect.integrate

### ** Examples

wrapper <- function(x, y, my.fun,...)
  {
    sapply(seq_along(x), FUN = function(i) my.fun(x[i], y[i],...))
  }

grid <- discretize(npoints=40,eps=1e-3,equi=FALSE)

Density <- outer(grid$X,grid$Y,FUN=wrapper,
                                 my.fun=function(x,y){10*((x/2)^2+y^2)})

rect.integrate(Density,npoints=40,eps=1e-3)



