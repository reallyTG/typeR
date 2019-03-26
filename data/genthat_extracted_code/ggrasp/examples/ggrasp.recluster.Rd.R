library(ggrasp)


### Name: ggrasp.recluster
### Title: ggrasp.recluster
### Aliases: ggrasp.recluster

### ** Examples

#The following data is from Chavda et al 2016 which phylotyped Enterobacter genomes
# Our example uses the data underpinning the tree shown in Figure 2

#Loading the tree 
library(ggrasp);
tree.file <- system.file("extdata", "Enter.kSNP.tree", package="ggrasp")
Enter.tree <- ggrasp.load(tree.file, file.format = "tree");

#Clustering the tree using a threshold estimated by Gaussian Mixture Models (GMMs)
## No test: 
Enter.tree.cluster <- ggrasp.cluster(Enter.tree)
## End(No test)


#Use print to get a list of the medoids selected
## No test: 
print(Enter.tree.cluster)
## End(No test)

#Re-clustering the tree using a threshold estimated by the GMMs but without the distribution
#cleaning (i.e. removing the overlapping and low count distributions)
## No test: 
Enter.tree.reclust <- ggrasp.recluster(Enter.tree.cluster, z.limit=0, min.lambda = 0)
## End(No test)




