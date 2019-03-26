library(clue)


### Name: cl_boot
### Title: Bootstrap Resampling of Clustering Algorithms
### Aliases: cl_boot
### Keywords: cluster

### ** Examples

## Study e.g. the effect of random kmeans() initializations.
data("Cassini")
pens <- cl_boot(Cassini$x, 15, 3)
diss <- cl_dissimilarity(pens)
summary(c(diss))
plot(hclust(diss))



