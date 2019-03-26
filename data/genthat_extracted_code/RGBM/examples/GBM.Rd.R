library(RGBM)


### Name: GBM
### Title: Calculate Gene Regulatory Network from Expression data using
###   either LS-TreeBoost or LAD-TreeBoost
### Aliases: GBM

### ** Examples

# load RGBM library
library("RGBM")
# this step is optional, it helps speed up calculations, run in parallel on 2 processors
library(doParallel)
cl <- makeCluster(2)
# run network inference on a 100-by-100 dummy expression data.
V = GBM()
stopCluster(cl)



