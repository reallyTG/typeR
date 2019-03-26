library(ACTCD)


### Name: cd.cluster
### Title: Cluster analysis for cognitive diagnosis based on the Asymptotic
###   Classification Theory
### Aliases: cd.cluster

### ** Examples

# Classification based on the simulated data and Q matrix
data(sim.dat)
data(sim.Q)
# Information about the dataset
N <- nrow(sim.dat) #number of examinees
J <- nrow(sim.Q) #number of items
K <- ncol(sim.Q) #number of attributes

#the default number of latent clusters is 2^K
cluster.obj <- cd.cluster(sim.dat, sim.Q)
#cluster size
sizeofc <- cluster.obj$size
#W statistics
W <- cluster.obj$W

#User-specified number of latent clusters
M <- 5  # the number of clusters is fixed to 5
cluster.obj <- cd.cluster(sim.dat, sim.Q, method="HACA", HACA.cut=M) 
#cluster size
sizeofc <- cluster.obj$size
#W statistics
W <- cluster.obj$W

M <- 5 # the number of clusters is fixed to 5
cluster.obj <- cd.cluster(sim.dat, sim.Q, method="Kmeans", Kmeans.centers =M)  
#cluster size
sizeofc <- cluster.obj$size
#W statistics
W <- cluster.obj$W



