library(future)


### Name: remote
### Title: Create a remote future whose value will be resolved
###   asynchronously in a remote process
### Aliases: remote

### ** Examples

## Not run: 
##D \donttest{
##D 
##D ## Use a remote machine
##D plan(remote, workers = "remote.server.org")
##D 
##D ## Evaluate expression remotely
##D host %<-% { Sys.info()[["nodename"]] }
##D host
##D [1] "remote.server.org"
##D 
##D 
##D ## The following setups are equivalent:
##D plan(remote, workers = "localhost")
##D plan(cluster, workers = "localhost", persistent = TRUE)
##D plan(cluster, workers = 1L, persistent = TRUE)
##D plan(multisession, workers = 1L, persistent = TRUE)
##D 
##D ## The following setups are equivalent:
##D plan(remote, workers = "remote.server.org")
##D plan(cluster, workers = "remote.server.org", persistent = TRUE, homogeneous = FALSE)
##D 
##D ## The following setups are equivalent:
##D cl <- makeClusterPSOCK("remote.server.org")
##D plan(remote, workers = cl)
##D plan(cluster, workers = cl, persistent = TRUE)
##D 
##D }
## End(Not run)



