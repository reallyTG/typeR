library(Rvcg)


### Name: vcgKmeans
### Title: fast Kmean clustering for 1D, 2D and 3D data
### Aliases: vcgKmeans

### ** Examples

require(Rvcg);require(rgl)
data(humface)
set.seed(42)
clust <- vcgKmeans(humface,k=1000,threads=1)



