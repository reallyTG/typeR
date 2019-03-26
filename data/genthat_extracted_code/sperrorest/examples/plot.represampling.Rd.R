library(sperrorest)


### Name: plot.represampling
### Title: Plot spatial resampling objects
### Aliases: plot.represampling plot.resampling

### ** Examples

data(ecuador)
# non-spatial cross-validation:
resamp <- partition_cv(ecuador, nfold = 5, repetition = 1:2)
# plot(resamp, ecuador)
# spatial cross-validation using k-means clustering:
resamp <- partition_kmeans(ecuador, nfold = 5, repetition = 1:2)
# plot(resamp, ecuador)




