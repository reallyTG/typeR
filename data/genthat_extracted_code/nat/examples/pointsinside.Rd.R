library(nat)


### Name: pointsinside
### Title: Find which points of an object are inside a surface
### Aliases: pointsinside pointsinside.default

### ** Examples

# check if the vertices in these neurons are inside the mushroom body calyx
# surface object
inout=pointsinside(kcs20, surf=subset(MBL.surf, "MB_CA_L"))
table(inout)

# be a bit more lenient and include points less than 5 microns from surface
MBCAL=subset(MBL.surf, "MB_CA_L")
inout5=pointsinside(kcs20, surf=MBCAL, rval='distance') > -5
table(inout5)
## No test: 
# show which points are in or out
# Hmm seems like there are a few red points in the vertical lobe
# that are well outside the calyx
points3d(xyzmatrix(kcs20), col=ifelse(inout5, 'red', 'black'))
plot3d(MBL.surf, alpha=.3)

# Let's try to make an alphashape for the mesh to clean it up
library(alphashape3d)
MBCAL.as=ashape3d(xyzmatrix(MBCAL), alpha = 10)
# Plotting the points, we can see that is much better behaved
points3d(xyzmatrix(kcs20), 
  col=ifelse(pointsinside(kcs20, MBCAL.as), 'red', 'black'))
## End(No test)

## Not run: 
##D # Show the face normals for a surface
##D if(require('Morpho')) {
##D   # convert to a mesh3d object used by rgl and Morpho packge
##D   MBCAL.mesh=as.mesh3d(subset(MBL.surf, "MB_CA_L"))
##D   fn=facenormals(MBCAL.mesh)
##D   wire3d(MBCAL.mesh)
##D   # show that the normals point out of the object
##D   plotNormals(fn, long=5, col='red')
##D   
##D   # invert the faces of the mesh and show that normals point in
##D   MBCAL.inv=invertFaces(MBCAL.mesh)
##D   plotNormals(facenormals(MBCAL.inv), long=5, col='cyan')
##D }
## End(Not run)



