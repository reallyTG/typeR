library(geometry)


### Name: surf.tri
### Title: Find surface triangles from tetrahedra mesh
### Aliases: surf.tri
### Keywords: dplot math optimize

### ** Examples

## Not run: 
##D # more extensive example of surf.tri
##D 
##D # url's of publically available data:
##D data1.url = "http://neuroimage.usc.edu/USCPhantom/mesh_data.bin"
##D data2.url = "http://neuroimage.usc.edu/USCPhantom/CT_PCS_trans.bin"
##D 
##D meshdata = R.matlab::readMat(url(data1.url))
##D elec = R.matlab::readMat(url(data2.url))$eeg.ct2pcs/1000
##D brain = meshdata$mesh.brain[,c(1,3,2)]
##D scalp = meshdata$mesh.scalp[,c(1,3,2)]
##D skull = meshdata$mesh.skull[,c(1,3,2)]
##D tbr = t(surf.tri(brain, delaunayn(brain)))
##D tsk = t(surf.tri(skull, delaunayn(skull)))
##D tsc = t(surf.tri(scalp, delaunayn(scalp)))
##D rgl::rgl.triangles(brain[tbr,1], brain[tbr,2], brain[tbr,3],col="gray")
##D rgl::rgl.triangles(skull[tsk,1], skull[tsk,2], skull[tsk,3],col="white", alpha=0.3)
##D rgl::rgl.triangles(scalp[tsc,1], scalp[tsc,2], scalp[tsc,3],col="#a53900", alpha=0.6)
##D rgl::rgl.viewpoint(-40,30,.4,zoom=.03)
##D lx = c(-.025,.025); ly = -c(.02,.02);
##D rgl::rgl.spheres(elec[,1],elec[,3],elec[,2],radius=.0025,col='gray')
##D rgl::rgl.spheres( lx, ly,.11,radius=.015,col="white")
##D rgl::rgl.spheres( lx, ly,.116,radius=.015*.7,col="brown")
##D rgl::rgl.spheres( lx, ly,.124,radius=.015*.25,col="black")
## End(Not run)



