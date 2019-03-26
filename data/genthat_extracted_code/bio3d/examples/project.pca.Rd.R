library(bio3d)


### Name: project.pca
### Title: Project Data onto Principal Components
### Aliases: project.pca z2xyz.pca xyz2z.pca
### Keywords: utilities

### ** Examples

## Not run: 
##D attach(transducin)
##D 
##D gaps.pos <- gap.inspect(pdbs$xyz)
##D 
##D #-- Do PCA without structures 2 and 7
##D pc.xray <- pca.xyz(pdbs$xyz[-c(2,7), gaps.pos$f.inds])
##D 
##D #-- Project structures 2 and 7 onto the PC space
##D d <- project.pca(pdbs$xyz[c(2,7), gaps.pos$f.inds], pc.xray)
##D 
##D plot(pc.xray$z[,1], pc.xray$z[,2],col="gray")
##D points(d[,1],d[,2], col="red")
##D 
##D detach(transducin)
## End(Not run)



