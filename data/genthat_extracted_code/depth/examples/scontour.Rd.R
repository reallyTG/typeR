library(depth)


### Name: scontour
### Title: Plotting spherical depth contours
### Aliases: scontour STD contourc
### Keywords: multivariate nonparametric robust directional

### ** Examples
## Plot of Tukey spherical depth for data on the circle.
set.seed(2011)
scontour(runif(30,min=0,max=2*pi))

## Tukey spherical depth contours for data 
## on the shpere expressed in spherical coordinates.
scontour(cbind(runif(20,min=0,max=2*pi),runif(20,min=0,max=pi)))

## Tukey spherical depth contours for data 
## on the sphere expressed in Euclidean coordinates.
x=matrix(rnorm(60),ncol=3)
x=t(apply(x,1,function(y){y/sqrt(sum(y^2))}))
scontour(x)



