library(sperrorest)


### Name: add.distance
### Title: Add distance information to resampling objects
### Aliases: add.distance add.distance.resampling
###   add.distance.represampling

### ** Examples

data(ecuador) # Muenchow et al. (2012), see ?ecuador
nsp.parti <- partition_cv(ecuador)
sp.parti <- partition_kmeans(ecuador)
nsp.parti <- add.distance(nsp.parti, ecuador)
sp.parti <- add.distance(sp.parti, ecuador)
# non-spatial partioning: very small test-training distance:
nsp.parti[[1]][[1]]$distance
# spatial partitioning: more substantial distance, depending on number of
# folds etc.
sp.parti[[1]][[1]]$distance




