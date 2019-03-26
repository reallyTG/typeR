## ----setup, include=FALSE------------------------------------------------
library("dtwclust")
library("RcppParallel")
library("parallel")

# knitr defaults
knitr::opts_chunk$set(eval = FALSE, comment = "#>")

## ----tl-dr---------------------------------------------------------------
#  # load dtwclust
#  library(dtwclust)
#  # load parallel
#  library(parallel)
#  # create multi-process workers
#  workers <- makeCluster(detectCores())
#  # load dtwclust in each one, and make them use 1 thread per worker
#  invisible(clusterEvalQ(workers, {
#      library(dtwclust)
#      RcppParallel::setThreadOptions(1L)
#  }))
#  # register your workers, e.g. with doParallel
#  require(doParallel)
#  registerDoParallel(workers)

## ----existing-scripts----------------------------------------------------
#  data("uciCT")
#  
#  # doing either of the following will calculate the distance matrix with parallelization
#  registerDoParallel(workers)
#  distmat <- proxy::dist(CharTraj, method = "dtw_basic")
#  registerDoSEQ()
#  distmat <- proxy::dist(CharTraj, method = "dtw_basic")

## ----prevent-mt----------------------------------------------------------
#  RcppParallel::setThreadOptions(1L)
#  distmat <- proxy::dist(CharTraj, method = "dtw_basic")

## ----family-dist---------------------------------------------------------
#  # instantiate the family and use the dtw::dtw function
#  fam <- new("tsclustFamily", dist = "dtw")
#  # register the parallel workers
#  registerDoParallel(workers)
#  # calculate distance matrix
#  distmat <- fam@dist(CharTraj)
#  # go back to sequential calculations
#  registerDoSEQ()

## ----reset-rcpp-parallel, eval = TRUE, include = FALSE-------------------
RcppParallel::setThreadOptions()

## ----rcpp-parallel-env, eval = TRUE--------------------------------------
# when this is *unset* (default), all threads are used
Sys.getenv("RCPP_PARALLEL_NUM_THREADS")

# parallel workers would seem the same,
# so dtwclust would try to configure 1 thread per worker
workers <- makeCluster(2L)
clusterEvalQ(workers, Sys.getenv("RCPP_PARALLEL_NUM_THREADS"))

# however, the environment variables get inherited by the workers upon creation
stopCluster(workers)
RcppParallel::setThreadOptions(2L)
Sys.getenv("RCPP_PARALLEL_NUM_THREADS") # for main process
workers <- makeCluster(2L)
clusterEvalQ(workers, Sys.getenv("RCPP_PARALLEL_NUM_THREADS")) # for each worker

## ----stop-workers-explicitly, eval = TRUE, include = FALSE---------------
stopCluster(workers)

## ----workers-and-threads-------------------------------------------------
#  workers <- makeCluster(4L)
#  clusterEvalQ(workers, RcppParallel::setThreadOptions(2L))

## ----compare-clusterings-example-----------------------------------------
#  comparison_partitional <- compare_clusterings(CharTraj, types = "p",
#                                                configs = p_cfgs,
#                                                seed = 32903L, trace = TRUE,
#                                                score.clus = score_fun,
#                                                pick.clus = pick_fun,
#                                                shuffle.configs = TRUE,
#                                                return.objects = TRUE)

## ----dtwclust-in-foreach-------------------------------------------------
#  results <- foreach(...) %dopar% {
#      RcppParallel::setThreadOptions(1L)
#      # any code that uses dtwclust...
#  }

