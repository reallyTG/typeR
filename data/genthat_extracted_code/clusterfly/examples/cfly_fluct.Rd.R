library(clusterfly)


### Name: cfly_fluct
### Title: Static plot: Fluctuation diagram. Draw a fluctuation diagram
###   comparing two clusterings.
### Aliases: cfly_fluct
### Keywords: hplot

### ** Examples

if (require("ggplot2")) {
o <- olive_example()
cfly_fluct(o, "kmeans", "Region")
cfly_fluct(o, "kmeans", "Region", clarify = FALSE)
}



