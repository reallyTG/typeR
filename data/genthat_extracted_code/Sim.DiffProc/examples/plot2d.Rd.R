library(Sim.DiffProc)


### Name: plot2d
### Title: Plotting for Class SDE
### Aliases: plot2d lines2d points2d plot3D plot2d.default lines2d.default
###   points2d.default plot3D.default

### ** Examples

## Example 1: 
set.seed(1234)

fx <- rep(expression(0),2)
gx <- rep(expression(1),2)

res <- snssde2d(drift=fx,diffusion=gx,N=10000)
plot2d(res,type="l")

## Example 2: 
set.seed(1234)

fx <- rep(expression(0),3)
gx <- rep(expression(1),3)

res <- snssde3d(drift=fx,diffusion=gx,N=10000)
plot3D(res,display="persp")
plot3D(res,display="rgl")



