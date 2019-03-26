library(nat)


### Name: plot3d.hxsurf
### Title: Plot amira surface objects in 3D using rgl
### Aliases: plot3d.hxsurf

### ** Examples

plot3d(kcs20)
plot3d(MBL.surf)

## No test: 
# plot only vertical lobe
clear3d()
plot3d(MBL.surf, materials="VL", alpha=0.3)

# everything except vertical lobe
clear3d()
plot3d(MBL.surf, alpha=0.3, 
  materials=grep("VL", MBL.surf$RegionList, value = TRUE, invert = TRUE))
## End(No test)



