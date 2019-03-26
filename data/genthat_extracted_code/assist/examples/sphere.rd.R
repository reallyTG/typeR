library(assist)


### Name: sphere
### Title: Calculate Pseudo Reproducing Kernels for Spherical Splines
### Aliases: sphere
### Keywords: file

### ** Examples

x<- seq(0, 2*pi, len=10)
y<- seq(-pi/2, pi/2, len=10)
s.ker<- sphere(cbind(x, y), order=3)



