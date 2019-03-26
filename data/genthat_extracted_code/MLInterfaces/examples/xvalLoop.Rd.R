library(MLInterfaces)


### Name: xvalLoop
### Title: Cross-validation in clustered computing environments
### Aliases: xvalLoop
### Keywords: methods

### ** Examples

## Not run: 
##D library(golubEsets)
##D data(Golub_Merge)
##D smallG <- Golub_Merge[200:250,]
##D 
##D # Evaluation on one node
##D 
##D lk1 <- xval(smallG, "ALL.AML", knnB, xvalMethod="LOO", group=as.integer(0))
##D table(lk1,smallG$ALL.AML)
##D 
##D # Evaluation on several nodes -- a cluster programmer might write the following...
##D 
##D library(snow)
##D setOldClass("spawnedMPIcluster")
##D 
##D setMethod("xvalLoop", signature( cluster = "spawnedMPIcluster"),
##D ## use the function returned below to evalutae
##D ## the central cross-validation loop in xval
##D function( cluster, ... ) {
##D     clusterExportEnv <- function (cl, env = .GlobalEnv)
##D     {
##D         unpackEnv <- function(env) {
##D             for ( name in ls(env) ) assign(name, get(name, env), .GlobalEnv )
##D             NULL
##D         }
##D         clusterCall(cl, unpackEnv, env)
##D     }
##D     function(X, FUN, ...) { # this gets returned to xval
##D         ## send all visible variables from the parent (i.e., xval) frame
##D         clusterExportEnv( cluster, parent.frame(1) )
##D         parLapply( cluster, X, FUN, ... )
##D     }
##D })
##D 
##D # ... and use the cluster like this...
##D 
##D cl <- makeCluster(2, "MPI")
##D clusterEvalQ(cl, library(MLInterfaces))
##D 
##D lk1 <- xval(smallG, "ALL.AML", knnB, xvalMethod="LOO", group=as.integer(0), cluster = cl)
##D table(lk1,smallG$ALL.AML)
## End(Not run)


