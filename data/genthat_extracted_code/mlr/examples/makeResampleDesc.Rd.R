library(mlr)


### Name: makeResampleDesc
### Title: Create a description object for a resampling strategy.
### Aliases: makeResampleDesc ResampleDesc hout cv2 cv3 cv5 cv10

### ** Examples

# Bootstraping
makeResampleDesc("Bootstrap", iters = 10)
makeResampleDesc("Bootstrap", iters = 10, predict = "both")

# Subsampling
makeResampleDesc("Subsample", iters = 10, split = 3/4)
makeResampleDesc("Subsample", iters = 10)

# Holdout a.k.a. test sample estimation
makeResampleDesc("Holdout")



