library(bios2mds)


### Name: kmeans.run
### Title: Multiple runs of K-means analysis
### Aliases: kmeans.run
### Keywords: clustering

### ** Examples

# Clustering human GPCRs in 4 groups with 100 runs of K-means
data(gpcr)
coord <- gpcr$mmds$sapiens.active$coord
kmeans.run1 <- kmeans.run(coord, nb.clus = 4, nb.run = 100)
kmeans.run1$clusters
kmeans.run1$elements



