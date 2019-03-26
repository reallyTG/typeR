library(gdimap)


### Name: synthfiberss2z
### Title: Voxel Diffusion Profiles for Multiple Fibre Simulation
### Aliases: synthfiberss2z
### Keywords: utilities dplot

### ** Examples

## Not run: 
##D     ## S2 grid
##D     s2 <- s2tessel.zorder(depth=3)
##D     g0 <- s2$pc
##D     ## synthetize diffusion signal (two crossing fibres)
##D     open3d()
##D     angles=c(20,100); b=3000
##D     S <- synthfiberss2z(g0=g0, angles=angles, b=b)
##D     ## synthetize signal with different volume fractions
##D     S <- synthfiberss2z(g0=g0, angles=angles, b=b, wi=c(0.7,0.3))
##D     ## synthesize diffusion signal (three crossing fibres)
##D     angles <- c(0,60,120); b <- 3000
##D     S <- synthfiberss2z(g0=g0, angles=angles, b=b)
## End(Not run)



