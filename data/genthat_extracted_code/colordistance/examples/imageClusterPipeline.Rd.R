library(colordistance)


### Name: imageClusterPipeline
### Title: Generate and plot a color distance matrix from a set of images
### Aliases: imageClusterPipeline

### ** Examples

## Not run: 
##D colordistance::imageClusterPipeline(dir(system.file("extdata", "Heliconius/",
##D package="colordistance"), full.names=TRUE), color.space="hsv", lower=rep(0.8,
##D 3), upper=rep(1, 3), cluster.method="hist", distance.method="emd",
##D hist.bins=3, plot.bins=TRUE, save.tree="example_tree.newick",
##D save.distance.matrix="example_DM.csv")
## End(Not run)




