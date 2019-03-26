library(hypervolume)


### Name: hypervolume_prune
### Title: Removes small hypervolumes from a HypervolumeList
### Aliases: hypervolume_prune

### ** Examples

# low sample sizes to meet CRAN time requirements
data(iris)
hv1 <- hypervolume_gaussian(iris[,1:3],kde.bandwidth=0.1)
hv1_segmented <- hypervolume_segment(hv1, 
                          num.points.max=100, distance.factor=1,
                          check.memory=FALSE) # intentionally under-segment
hv1_segmented_pruned <- hypervolume_prune(hv1_segmented, 
                          num.points.min=10)
plot(hv1_segmented_pruned)



