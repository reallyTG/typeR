library(densityClust)


### Name: plotDensityClust
### Title: Plot densityCluster results
### Aliases: plotDensityClust

### ** Examples

data(iris)
data.dist <- dist(iris[, 1:4])
pca <- princomp(iris[, 1:4])

# Run initial density clustering
dens.clust <- densityClust(data.dist)
op <- par(ask = TRUE)

# Show the decision graph
plotDensityClust(dens.clust, type = "dg")

# Show the decision graph and the gamma graph
plotDensityClust(dens.clust, type = c("dg", "gg"))

# Cluster based on rho and delta
new.clust <- findClusters(dens.clust, rho = 4, delta = 2)

# Show all graphs with clustering
plotDensityClust(new.clust, mds = pca$scores)

par(op)




