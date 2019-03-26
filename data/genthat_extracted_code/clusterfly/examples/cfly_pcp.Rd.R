library(clusterfly)


### Name: cfly_pcp
### Title: Static plot: Parallel coordinates. Draw a parallel coordinates
###   plot, facetted across clustering.
### Aliases: cfly_pcp
### Keywords: hplot

### ** Examples

if (require("ggplot2")) {
o <- olive_example()
cfly_pcp(o, "kmeans")
cfly_pcp(o, "kmeans", alpha = 1/10)
cfly_pcp(o, "kmeans", alpha = 1/10) + coord_flip()
}



