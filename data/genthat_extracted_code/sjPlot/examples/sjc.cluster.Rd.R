library(sjPlot)


### Name: sjc.cluster
### Title: Compute hierarchical or kmeans cluster analysis
### Aliases: sjc.cluster

### ** Examples

# Hierarchical clustering of mtcars-dataset
groups <- sjc.cluster(mtcars, 5)

# K-means clustering of mtcars-dataset
groups <- sjc.cluster(mtcars, 5, method="k")




