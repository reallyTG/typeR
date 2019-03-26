library(pbmcapply)


### Name: pbmcmapply
### Title: Tracking mcmapply with progress bar
### Aliases: pbmcmapply

### ** Examples

# A lazy sqrt function which doesn't care about efficiency
lazySqrt <- function(num) {
  # Sleep randomly between 0 to 0.5 second
  Sys.sleep(runif(1, 0, 0.5))
  return(sqrt(num))
}

# On Windows, set cores to be 1
if (.Platform$OS.type == "windows") {
  cores = 1
} else {
  cores = 2
}

# A lazy and chatty sqrt function.
# An example of passing arguments to pbmcmapply.
lazyChattySqrt <- function(num, name) {
  # Sleep randomly between 0 to 0.5 second
  Sys.sleep(runif(1, 0, 0.5))
  return(sprintf("Hello %s, the sqrt of %f is %f.", toString(name), num, sqrt(num)))
}

# Get the sqrt of 1-3 in parallel
result <- pbmcmapply(lazySqrt, 1:3, mc.cores = cores)
chattyResult <- pbmcmapply(lazyChattySqrt, 1:3, MoreArgs = list("Bob"), mc.cores = cores)



