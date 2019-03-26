library(LSD)


### Name: heatpairs
### Title: Pairwise colored scatterplot based on a two-dimensional Kernel
###   Density Estimation
### Aliases: LSD.heatpairs heatpairs
### Keywords: heatcolors scatterplot,

### ** Examples

points = 10^4
x = rnorm(points/2)
x = c(x,x+2.5)
y = x + rnorm(points,sd=0.75)
x = sign(x)*abs(x)^1.3
mat = cbind(x,y,x + rnorm(points,sd=0.5))
colnames(mat) = c("x","y","z")
rownames(mat) = 1:nrow(mat)

heatpairs(mat,labels=c(expression(Xi),expression(Lambda),expression(Delta)))



