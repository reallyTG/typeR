library(wrapr)


### Name: parLapplyLBm
### Title: Memoizing wrapper for parLapplyLB
### Aliases: parLapplyLBm

### ** Examples


if(requireNamespace("parallel", quietly = TRUE)) {
  cl <- parallel::makeCluster(2)
  fs <- function(x) { x <- x[[1]]; Sys.sleep(1); sin(x) }
  # without memoization should take 1000 seconds
  lst <- parLapplyLBm(cl, c(rep(0, 1000), rep(1, 1000)), fs)
  parallel::stopCluster(cl)
}




