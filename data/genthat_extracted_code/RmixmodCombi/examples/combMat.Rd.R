library(RmixmodCombi)


### Name: combMat
### Title: Combining Matrix
### Aliases: combMat
### Keywords: cluster

### ** Examples


set.seed(1)

data(Baudry_etal_2010_JCGS_examples)
res <- mixmodCombi(ex4.1, nbCluster = 1:8)

res@hierarchy[[5]]@proba # each line of this matrix is the vector of the posterior probabilities of
# each class for an observation in the 5-cluster solution

t(combMat(5, 3, 4) %*% t(res@hierarchy[[5]]@proba) ) # each line of this matrix is the vector of
# the posterior probabilities of each class for an observation in the 4-cluster solution obtained by
# combining clusters 3 and 4 in the 5-cluster solution




