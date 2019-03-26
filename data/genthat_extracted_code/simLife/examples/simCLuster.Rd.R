library(simLife)


### Name: simCluster
### Title: Generate clustered regions
### Aliases: simCluster

### ** Examples

## Not run: 
##D 
##D ## Simulate and densify particle system
##D ## densify and include a secondary phase
##D 
##D library(unfoldr)
##D 
##D ## Unless MS-Windows platform	
##D # library(parallel)
##D # options(simLife.mc=2L)
##D  
##D # simulation box either this kind of list
##D # or use object spatstat::box3 
##D box <- list("xrange"=c(0,3),"yrange"=c(0,3),"zrange"=c(0,9))
##D 
##D # parameter for spheroids simulation 
##D theta <- list("size"=list(0.25),"shape"=list("s"=0.25), "orientation"=list("kappa"=1))
##D 
##D # for ease of use: constant size particles
##D S <- simPoissonSystem(theta,lam=15,size="const",type="prolate",
##D 			orientation="rbetaiso",box=box,mu=c(0,1,0),pl=1,label="P")
##D 	
##D ## 2nd. phase (ferrit)	
##D param <- list("size"=list(0.075), "shape"=list("s"=0.75))
##D F <- simPoissonSystem(param,lam=2,size="const",type="prolate",
##D 		box=box,mu=c(0,1,0),pl=1,label="P")
##D 
##D # apply RSA, this may take some 
##D RSA <- rsa(S,F,verbose=TRUE)
##D 
##D ## show 3D spheroids (non-overlapping)
##D # library(rgl)
##D # cols <- c("#0000FF","#00FF00","#FF0000","#FF00FF","#FFFF00","#00FFFF")
##D # spheroids3d(RSA[1:length(S)], box, col=cols)	
##D # spheroids3d(RSA[length(S):(length(S)+length(F))], box, col="gray")
##D 
##D ## construct clusters
##D CL <- simPoissonSystem(list("size"=list(0.35)), lam=0.1, size="const",
##D 			type="spheres", box=box, pl=1, label="F")
##D 
##D CLUST <- simCluster(RSA, CL, verbose=TRUE)
##D cat("cluster length: ",length(CLUST),"\n")
##D 
##D ## show cluster regions
##D # library(rgl)
##D # open3d()
##D # X <- do.call(rbind,lapply(CLUST, function(x) c(x$center,x$r)))
##D # invisible(lapply(CLUST, function(x) rgl::spheres3d(X[,1:3],radius=X[,4],col="gray",alpha=0.2)))
##D # cols <- c("#0000FF","#00FF00","#FF0000","#FF00FF","#FFFF00","#00FFFF")
##D # invisible(lapply(CLUST, function(x) spheroids3d(RSA[x$id],box,col=cols)))
##D 
##D # some controls for 'GenSA'
##D ctrl <- list(threshold.stop=0.01,max.call=10000)
##D # densify region to clustered particles
##D RET <- densifyCluster(RSA, CLUST, ctrl, weight=100, cores = 1L, cl = NULL)	
##D 
##D S <- RET$S
##D CL <- RET$cluster
##D 
##D ## show densified clusters 
##D # library(rgl)
##D # open3d()
##D # X <- do.call(rbind,lapply(CLUST, function(x) c(x$center,x$r)))
##D # invisible(lapply(CLUST, function(x)
##D # rgl::spheres3d(x=X[,1:3],radius=X[,4],col="gray",alpha=0.2)))
##D # invisible(lapply(CL, function(x) { spheroids3d(x, box, col=cols) }))
##D 	
## End(Not run)	



