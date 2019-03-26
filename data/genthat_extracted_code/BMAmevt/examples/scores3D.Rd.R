library(BMAmevt)


### Name: scores3D
### Title: Logarithmic score and L^2 distance between two densities on the
###   simplex (trivariate case).
### Aliases: scores3D

### ** Examples

dens1=dpairbeta.grid(par=c(0.8,2,5,8),npoints=150,eps=1e-3,
                     equi=FALSE)
dens2=dnestlog.grid(par=c(0.5,0.8,0.4,0.6),npoints=150,eps=1e-3, equi=FALSE)

scores3D(true.dens=dens1,
  est.dens=dens2,
  npoints=150, eps=1e-4)



