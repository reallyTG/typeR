library(clusterfly)


### Name: cfly_dist
### Title: Static plot: Variable distribution. Draw a density plot for each
###   continuous variable, facetted across clustering.
### Aliases: cfly_dist
### Keywords: hplot

### ** Examples

if (require("ggplot2")) {
o <- olive_example()
cfly_dist(o, "kmeans")
cfly_dist(o, "kmeans") + scale_y_continuous(limit=c(0, 2))
}



