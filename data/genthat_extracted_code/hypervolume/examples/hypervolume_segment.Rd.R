library(hypervolume)


### Name: hypervolume_segment
### Title: Segments a hypervolume into multiple separate hypervolumes.
### Aliases: hypervolume_segment

### ** Examples

# low sample sizes to meet CRAN time requirements
data(iris)
hv1 <- hypervolume_gaussian(iris[,1:3],kde.bandwidth=0.1)
hv1_segmented <- hypervolume_segment(hv1, num.points.max=100, 
                  distance.factor=2, check.memory=FALSE)
plot(hv1_segmented)



