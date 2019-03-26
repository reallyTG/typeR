library(subspace)


### Name: plot.subspace_clustering
### Title: Plotting Subspace Clusterings
### Aliases: plot plot.subspace_clustering

### ** Examples

#Load the example dataset for this package
data("subspace_dataset")
#Load the true clustering for this dataset
path_to_clustering <- paste(path.package("subspace"),"/extdata/subspace_dataset.true",sep="")
clustering <- clustering_from_file(file_path=path_to_clustering)
#also generate a clustering with one of the algorithms
clustering2 <- CLIQUE(subspace_dataset,tau=0.2)

#now plot the generated clustering
plot(clustering2,subspace_dataset)
#plot the true clustering with small points
plot(clustering,subspace_dataset,size=0.1)

#Now plot the points with a different shape.
#This requires the workaround that was discussed in "Notes"
p <- ggvis::prop(property="shape",x="cross")
plot(clustering,subspace_dataset,props=p)



