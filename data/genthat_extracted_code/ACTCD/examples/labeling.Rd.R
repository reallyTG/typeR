library(ACTCD)


### Name: labeling
### Title: labeling for clusters
### Aliases: labeling

### ** Examples

#Labeling based on simulated data and Q matrix
data(sim.dat)
data(sim.Q)

# Information about the dataset
N <- nrow(sim.dat) #number of examinees
J <- nrow(sim.Q) #number of items
K <- ncol(sim.Q) #number of attributes

# Assume 2^K latent clusters
cluster.obj <- cd.cluster(sim.dat, sim.Q)
# Different clusters may have the same attribute patterns
labeled.obj.2b <- labeling(sim.dat, sim.Q, cluster.obj, method="2b")
# Different clusters mhave different attribute patterns
labeled.obj.2a <- labeling(sim.dat, sim.Q, cluster.obj, method="2a")
# labeling using method 1
data(perm3)  #since the number of attributes in this example is 3, perm3 is used here
labeled.obj.1 <- labeling(sim.dat, sim.Q, cluster.obj, method="1",perm=perm3)
remove(perm3) #remove perm3 

# Assume 5 attribute patterns exist
M <- 5
cluster.obj <- cd.cluster(sim.dat, sim.Q, method="HACA", HACA.cut=M) 
labeled.obj <- labeling(sim.dat, sim.Q, cluster.obj, method="2b")





