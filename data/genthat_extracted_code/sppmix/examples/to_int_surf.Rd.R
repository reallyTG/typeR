library(sppmix)


### Name: to_int_surf
### Title: Convert a normal mixture to an intensity surface
### Aliases: to_int_surf

### ** Examples

## No test: 
truemix <- normmix(ps=c(.4, .2,.4), mus=list(c(0.3, 0.3), c(.5,.5),c(0.7, 0.7)),
 sigmas = list(.02*diag(2), .05*diag(2),.01*diag(2)))
intsurf=to_int_surf(truemix, lambda = 100, win = spatstat::square(1))
#plot the true mixture
plot(intsurf,main = "True Poisson intensity surface (mixture of normal components)")
# using the demo_mix normmix object
summary(demo_mix)
demo_surf1=to_int_surf(demo_mix, lambda = 100, win = spatstat::square(1))
plot(demo_surf1)
# using an intensity_surface object
summary(demo_intsurf)
demo_surf2=to_int_surf(demo_intsurf, win = spatstat::square(2))
summary(demo_surf2)
plot(demo_surf2)
demo_surf3=to_int_surf(demo_intsurf, lambda = 50)
plot(demo_surf3)
## End(No test)




