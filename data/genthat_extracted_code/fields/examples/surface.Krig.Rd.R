library(fields)


### Name: surface.Krig
### Title: Plots a surface and contours
### Aliases: surface.Krig surface.mKrig
### Keywords: spatial

### ** Examples

fit<- Krig(ChicagoO3$x,ChicagoO3$y, theta=30)  # krig fit 

#Image plot of surface with nice, smooth  contours and shading

surface(fit, type="C", nx=128, ny=128) 
 



