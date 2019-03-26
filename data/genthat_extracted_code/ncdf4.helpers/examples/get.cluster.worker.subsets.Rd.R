library(ncdf4.helpers)


### Name: get.cluster.worker.subsets
### Title: Get subsets to be distributed to workers
### Aliases: get.cluster.worker.subsets

### ** Examples

## Get a subset from an example
subsets <- get.cluster.worker.subsets(1E7, c(128, 64, 50000),
                                      c(lon="X", lat="Y", time="T"), "Y")



