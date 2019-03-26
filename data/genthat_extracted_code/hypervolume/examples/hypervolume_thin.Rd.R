library(hypervolume)


### Name: hypervolume_thin
### Title: Reduces the number of random points in a hypervolume
### Aliases: hypervolume_thin

### ** Examples

data(iris)
hv1 = hypervolume_gaussian(subset(iris, Species=="setosa")[,1:3])

# downsample to 1000 random points
hv1_thinned = hypervolume_thin(hv1, num.points=1000)
hv1_thinned



