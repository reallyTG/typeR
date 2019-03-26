library(ClusterStability)


### Name: ClusterStability_exact
### Title: Calculates the exact stability score (_ST_) for individual
###   objects in a clustering solution.
### Aliases: ClusterStability_exact
### Keywords: Stability score,ST,individual,global,exact

### ** Examples

   ## Calculate the stability scores of individual objects of the Iris dataset
   ## using K-means, 100 replicates (random starts) and k=3
   ClusterStability_exact(dat=iris[1:4],k=3,replicate=100,type='kmeans');



