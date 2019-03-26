library(depth)


### Name: sdepth
### Title: Calculation of spherical depth
### Aliases: sdepth
### Keywords: multivariate nonparametric robust directional

### ** Examples
## Tukey spherical depth for a dataset on the circle
set.seed(2011)
sdepth(pi,runif(50,min=0,max=2*pi))

## Tukey spherical depth for data in spherical coordinates.
sdepth(c(pi,pi/2),cbind(runif(50,min=0,max=2*pi),runif(50,min=0,max=pi)))

## Tukey spherical depth for data in Eudlidean coordinates.
x=matrix(rnorm(150),ncol=3)
x=t(apply(x,1,function(y){y/sqrt(sum(y^2))}))
sdepth(x[1,],x)



