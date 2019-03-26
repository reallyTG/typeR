library(simLife)


### Name: getCylinderProjection
### Title: Fiber defect projections
### Aliases: getCylinderProjection

### ** Examples

## Not run: 
##D 
##D ## Simulate Poisson cylinder system,
##D ## generate a non-overlapping system by RSA,
##D ## densify a cluster of cylinders
##D 
##D library(unfoldr)
##D 
##D ## Unless MS-Windows platform	
##D # library(parallel)
##D # options(simLife.mc=2L)
##D 
##D lam <- 35
##D box <- list("xrange"=c(0,3),"yrange"=c(0,3),"zrange"=c(0,9))
##D 
##D ## Spheroids of constant sizes
##D theta <- list("size"=list(.5),"shape"=list("radius"=0.1),
##D 		"orientation"=list("kappa"=0.1))
##D 
##D S <- simPoissonSystem(theta,lam,size="const",type="cylinders",
##D 		orientation="rbetaiso",box=box,pl=1,label="P")
##D 
##D ## secondary phase: particles as spheres
##D F <- simPoissonSystem(list("size"=list(0.075)), lam=5, size="const",
##D 		type="spheres",box=box, pl=1, label="F")
##D 
##D ## apply RSA
##D S2 <- rsa(S,F,pl=101,verbose=TRUE)
##D ####################################################################
##D ## Optional: 3D visualization of cylinder projection areas
##D ####################################################################
##D 
##D #require(rgl)
##D #id <- c(1,5,9,32,10)
##D #cols <- c("#0000FF","#00FF00","#FF0000","#FF00FF","#FFFF00","#00FFFF")
##D #cylinders3d(S2[id], box, col=cols)	
##D #P <- getCylinderProjection(S2[id], B=c(0,1,0,1,1), draw=TRUE, conv = TRUE, np=20)
##D #P <- getCylinderProjection(S2[id], B=c(0,0,0,0,0), draw=TRUE, conv = TRUE, np=20)
##D #P <- getCylinderProjection(S2[id], B=c(1,1,1,1,1), draw=TRUE, conv = TRUE, np=20)
##D 
##D ## construct clusters
##D CL <- simPoissonSystem(list("size"=list(0.35)), lam=0.1, size="const",
##D 		type="spheres", box=box, pl=1, label="F")
##D 
##D CLUST <- simCluster(S2, CL, cond=list("eps"=1e-7,"minSize"=1L), verbose=TRUE, pl=1)
##D 	
##D ## densify
##D ctrl <- list(threshold.stop=0.01,max.call=5000,verbose=FALSE)
##D RET <- densifyCluster(S2, CLUST, ctrl, weight=10, cores = 1L, cl = NULL)	
##D G <- RET$cluster
##D 
##D ####################################################################
##D ## Optional: 3D visualization of densified sphere clusters
##D ####################################################################
##D 
##D #open3d()
##D #lapply(CLUST,function(x) cylinders3d(S2[x$id],box=box,col=cols))	
##D #X <- do.call(rbind,lapply(CLUST, function(x) c(x$center,x$r)))
##D #invisible(lapply(CLUST, function(x) rgl::spheres3d(X[,1:3],radius=X[,4],col="gray",alpha=0.2)))
##D #
##D ### draw densified cluster
##D #open3d()
##D #invisible(lapply(G,function(x) { cylinders3d(x,box=box,col=cols) }))
##D #invisible(lapply(CLUST, function(x) rgl::spheres3d(X[,1:3],radius=X[,4],col="gray",alpha=0.2)))
##D 
## End(Not run)



