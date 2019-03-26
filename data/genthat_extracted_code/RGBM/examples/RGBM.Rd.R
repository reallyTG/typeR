library(RGBM)


### Name: RGBM
### Title: Regularized Gradient Boosting Machine for inferring GRN
### Aliases: RGBM

### ** Examples

# load RGBM library
library("RGBM")
# this step is optional, it helps speed up calculations, run in parallel on 2 processors
library(doParallel)
cl <- makeCluster(2)
# run network inference on a 100-by-100 dummy expression data.
A = RGBM()
stopCluster(cl)




