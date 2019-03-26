library(colordistance)


### Name: exportTree
### Title: Export a distance matrix as a tree object
### Aliases: exportTree

### ** Examples

clusterList <- colordistance::getHistList(dir(system.file("extdata",
"Heliconius/", package="colordistance"), full.names=TRUE), lower=rep(0.8, 3),
upper=rep(1, 3))
CDM <- colordistance::getColorDistanceMatrix(clusterList, method="emd",
plotting=FALSE)

# Tree is both saved in current working directory and stored in
# heliconius_tree variable
heliconius_tree <- colordistance::exportTree(CDM,
"./HeliconiusColorTree.newick", return.tree=TRUE)



