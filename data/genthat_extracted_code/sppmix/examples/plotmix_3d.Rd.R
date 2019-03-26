library(sppmix)


### Name: plotmix_3d
### Title: Plot the density or intensity of a normal mixture in 3d over a
###   fine grid
### Aliases: plotmix_3d

### ** Examples

## No test: 
truemix <- rnormmix(m = 5, sig0 = .1, df = 5, xlim= c(0, 3), ylim = c(0, 3))
normdens=dnormmix(truemix, xlim= c(0, 3), ylim = c(0, 3))
plotmix_3d(normdens)
plotmix_3d(normdens, title1="Density of a normal mixture")
#use the demo_mix and demo_truemix3comp objects; the windows are found in the
#corresponding demo demo_intsurf and demo_intsurf3comp
demo_intsurf$window
normdens1=dnormmix(demo_mix, xlim= c(0, 1), ylim = c(0, 1))
plotmix_3d(normdens1, title1="Density of a normal mixture, 2 components")
#change the window
normdens1=dnormmix(demo_mix, xlim= c(-1, 1.5), ylim = c(-1, 1.5))
plotmix_3d(normdens1, title1="Density of a normal mixture, 2 components")
demo_intsurf3comp$window
normdens2=dnormmix(demo_truemix3comp, xlim= c(-1, 1), ylim = c(-2, 3))
plotmix_3d(normdens2, title1="Density of a normal mixture, 3 components")
## End(No test)




