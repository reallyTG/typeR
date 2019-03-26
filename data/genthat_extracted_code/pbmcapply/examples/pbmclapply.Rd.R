library(pbmcapply)


### Name: pbmclapply
### Title: Tracking mclapply with progress bar
### Aliases: pbmclapply

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
# An example of passing arguments to pbmclapply.
lazyChattySqrt <- function(num, name) {
  # Sleep randomly between 0 to 0.5 second
  Sys.sleep(runif(1, 0, 0.5))
  return(sprintf("Hello %s, the sqrt of %f is %f.", toString(name), num, sqrt(num)))
}

# Get the sqrt of 1-3 in parallel
result <- pbmclapply(1:3, lazySqrt, mc.cores = cores)
chattyResult <- pbmclapply(1:3, lazyChattySqrt, "Bob", mc.cores = cores)



