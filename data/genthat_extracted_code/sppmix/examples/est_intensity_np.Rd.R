library(sppmix)


### Name: est_intensity_np
### Title: Estimate the intensity surface using a non-parametric method
### Aliases: est_intensity_np

### ** Examples

## No test: 
mix1 <- rnormmix(5, sig0 = .01, df = 5, xlim=c(0, 5),ylim=c(0, 5))
intsurf1=to_int_surf(mix1,lambda = 40, win =spatstat::owin( c(0, 5),c(0, 5)))
plot(intsurf1)
pp1 <- rsppmix(intsurf1)
# estimate and plot the estimated intensity surface
surfNP1 <- est_intensity_np(pp1, win=spatstat::owin( c(0, 5),c(0, 5)), h=0.05,
 L=100,truncate = FALSE)
plotmix_3d(surfNP1,title1="Non parametric estimator of the intensity surface")
#truncate components to have all their mass in the window
surfNP2 <- est_intensity_np(pp1, win=spatstat::owin( c(0, 5),c(0, 5)), h=0.5, L=100)
plotmix_3d(surfNP2,title1="(Truncated) Non parametric estimator of the intensity surface")
## End(No test)




