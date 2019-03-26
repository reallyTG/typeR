library(ClusterStability)


### Name: ClusterStability
### Title: Calculates the approximate stability score (_ST_) of individual
###   objects in a clustering solution (the approximate version allowing
###   one to avoid possible variable overflow errors).
### Aliases: ClusterStability
### Keywords: Stability score,ST,individual,global,approximative

### ** Examples

   ## Calculates the stability scores of individual objects of the Iris dataset
   ## using K-means, 100 replicates (random starts) and k=3
   ClusterStability(dat=iris[1:4],k=3,replicate=100,type='kmeans');



