library(sppmix)


### Name: plot.intensity_surface
### Title: Plots a normal mixture intensity in 3d
### Aliases: plot.intensity_surface

### ** Examples

## No test: 
truemix <- rnormmix(m = 5, sig0 = .1, df = 5, xlim= c(-1, 5), ylim =c(2, 5))
intsurf=to_int_surf(truemix, lambda = 200, win =spatstat::owin( c(-1, 5),c(2, 5)))
plot(intsurf,main = "True Poisson intensity surface (mixture of normal components)")
#use the demo intensity surface
demo_intsurf
summary(demo_intsurf)
#3d plot of the intensity surface
plot(demo_intsurf,main = "True Poisson intensity surface (mixture of normal components)")
## End(No test)




