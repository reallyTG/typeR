library(LCAvarsel)


### Name: compareCluster
### Title: Clustering comparison criteria
### Aliases: compareCluster

### ** Examples

cl1 <- sample(1:3, 100, replace = TRUE)
cl2 <- sample(letters[1:4], 100, replace = TRUE)
compareCluster(cl1, cl2)
compareCluster(cl1, cl1)   # perfect matching



