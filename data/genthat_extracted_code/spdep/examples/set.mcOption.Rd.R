library(spdep)


### Name: set.mcOption
### Title: Options for parallel support
### Aliases: set.ClusterOption get.ClusterOption set.mcOption
###   get.coresOption set.coresOption get.mcOption
### Keywords: spatial

### ** Examples

ls(envir=spdep:::.spdepOptions)
library(parallel)
nc <- detectCores(logical=FALSE)
nc
# set nc to 1L here
if (nc > 1L) nc <- 1L
#nc <- ifelse(nc > 2L, 2L, nc)
coresOpt <- get.coresOption()
coresOpt
if (!is.na(nc)) {
 invisible(set.coresOption(nc))
 print(exists("aple.mc"))
 if(.Platform$OS.type == "windows") {
# forking not permitted on Windows - start cluster
  print(get.mcOption())
  cl <- makeCluster(get.coresOption())
  print(clusterEvalQ(cl, exists("aple.mc")))
  set.ClusterOption(cl)
  clusterEvalQ(get.ClusterOption(), library(spdep))
  print(clusterEvalQ(cl, exists("aple.mc")))
  clusterEvalQ(get.ClusterOption(), detach(package:spdep))
  set.ClusterOption(NULL)
  print(clusterEvalQ(cl, exists("aple.mc")))
  stopCluster(cl)
 } else {
  mcOpt <- get.mcOption()
  print(mcOpt)
  print(mclapply(1:get.coresOption(), function(i) exists("aple.mc"),
   mc.cores=get.coresOption()))
  invisible(set.mcOption(FALSE))
  cl <- makeCluster(nc)
  print(clusterEvalQ(cl, exists("aple.mc")))
  set.ClusterOption(cl)
  clusterEvalQ(get.ClusterOption(), library(spdep))
  print(clusterEvalQ(cl, exists("aple.mc")))
  clusterEvalQ(get.ClusterOption(), detach(package:spdep))
  set.ClusterOption(NULL)
  print(clusterEvalQ(cl, exists("aple.mc")))
  stopCluster(cl)
  invisible(set.mcOption(mcOpt))
 }
 invisible(set.coresOption(coresOpt))
}



