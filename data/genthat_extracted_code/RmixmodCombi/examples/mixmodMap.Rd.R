library(RmixmodCombi)


### Name: mixmodMap
### Title: Computes a hard clustering corresponding to a soft clustering
### Aliases: mixmodMap
### Keywords: cluster

### ** Examples


set.seed(1)

data(Baudry_etal_2010_JCGS_examples)
res <- mixmodCombi(ex4.1, nbCluster = 1:8)

res@hierarchy[[3]]@proba[1:10,] # Is the matrix of posterior probabilities of each of the combined
# classes in the 3-class solution, for the 10 first observations

mixmodMap(res@hierarchy[[3]]@proba[1:10,]) # Is the matrix of corresponding class assignments for 
# the 10 first observations (available as a labels vector: res@hierarchy[[3]]@partition[1:10])




