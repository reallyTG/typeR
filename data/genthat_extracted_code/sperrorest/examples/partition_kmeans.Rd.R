library(sperrorest)


### Name: partition_kmeans
### Title: Partition samples spatially using k-means clustering of the
###   coordinates
### Aliases: partition_kmeans

### ** Examples

data(ecuador)
resamp <- partition_kmeans(ecuador, nfold = 5, repetition = 2)
# plot(resamp, ecuador)




