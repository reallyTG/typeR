library(nat)


### Name: subset.hxsurf
### Title: Subset hxsurf object to specified regions
### Aliases: subset.hxsurf

### ** Examples

# plot only vertical lobe
vertical_lobe=subset(MBL.surf, "VL")
## No test: 
plot3d(vertical_lobe, alpha=0.3)
plot3d(kcs20)

# there is also a shortcut for this
clear3d()
plot3d(MBL.surf, "VL", alpha=0.3)
## End(No test)



