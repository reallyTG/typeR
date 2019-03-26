library(bliss)


### Name: sim_x
### Title: sim_x
### Aliases: sim_x

### ** Examples

library(RColorBrewer)
### Fourier
param <- list(n=15,p=100,grid=seq(0,1,length=100),x_shape="Fourier")
x <- sim_x(param)
cols <- colorRampPalette(brewer.pal(9,"YlOrRd"))(15)
matplot(param$grid,t(x),type="l",lty=1,col=cols)
### Fourier2
param <- list(n=15,p=100,grid=seq(0,1,length=100),x_type="Fourier2")
x <- sim_x(param)
cols <- colorRampPalette(brewer.pal(9,"YlOrRd"))(15)
matplot(param$grid,t(x),type="l",lty=1,col=cols)
### random_walk
param <- list(n=15,p=100,grid=seq(0,1,length=100),x_type="random_walk")
x <- sim_x(param)
cols <- colorRampPalette(brewer.pal(9,"YlOrRd"))(15)
matplot(param$grid,t(x),type="l",lty=1,col=cols)
### random_sharp
param <- list(n=15,p=100,grid=seq(0,1,length=100),x_type="random_sharp")
x <- sim_x(param)
cols <- colorRampPalette(brewer.pal(9,"YlOrRd"))(15)
matplot(param$grid,t(x),type="l",lty=1,col=cols)
### uniform
param <- list(n=15,p=100,grid=seq(0,1,length=100),x_type="uniform")
x <- sim_x(param)
cols <- colorRampPalette(brewer.pal(9,"YlOrRd"))(15)
matplot(param$grid,t(x),type="l",lty=1,col=cols)
### gaussian
param <- list(n=15,p=100,grid=seq(0,1,length=100),x_type="gaussian")
x <- sim_x(param)
cols <- colorRampPalette(brewer.pal(9,"YlOrRd"))(15)
matplot(param$grid,t(x),type="l",lty=1,col=cols)
### mvgauss
param <- list(n=15,p=100,grid=seq(0,1,length=100),x_type="mvgauss")
x <- sim_x(param)
cols <- colorRampPalette(brewer.pal(9,"YlOrRd"))(15)
matplot(param$grid,t(x),type="l",lty=1,col=cols)



