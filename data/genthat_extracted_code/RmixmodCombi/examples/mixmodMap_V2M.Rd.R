library(RmixmodCombi)


### Name: mixmodMap_V2M
### Title: Vector of Labels to Matrix of Class Assignments Conversion
### Aliases: mixmodMap_V2M
### Keywords: cluster

### ** Examples


set.seed(1)

data(Baudry_etal_2010_JCGS_examples)
res <- mixmodCombi(ex4.1, nbCluster = 1:8)

res@hierarchy[[3]]@partition[1:10] # Is the labels vector of the classes assigned to the 10 first 
# observations

mixmodMap_V2M(res@hierarchy[[3]]@partition[1:10]) #  Is the corresponding matrix of class 
# assignments for the 10 first observations 




