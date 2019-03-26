library(nat)


### Name: as.mesh3d
### Title: Convert an object to an rgl mesh3d
### Aliases: as.mesh3d as.mesh3d.ashape3d as.mesh3d.hxsurf

### ** Examples

## No test: 
library(alphashape3d)
kcs20.a=ashape3d(xyzmatrix(kcs20), alpha = 10)
plot(kcs20.a)

# convert to mesh3d
kcs20.mesh=as.mesh3d(kcs20.a)

# check that all points are inside mesh
all(pointsinside(kcs20, kcs20.mesh))
# and show that we can also use the alphashape directly
all(pointsinside(kcs20, kcs20.a))

clear3d()
wire3d(kcs20.mesh)
plot3d(kcs20, col=type, lwd=2)
## End(No test)



