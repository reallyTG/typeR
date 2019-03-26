library(PropClust)


### Name: propensityClustering
### Title: Propensity clustering
### Aliases: propensityClustering
### Keywords: cluster misc

### ** Examples


# Simulate 50 nodes in 5 clusters
nNodes=50
nClusters=5
# We would like to use L2Norm instead of Loglikelihood
objective = "L2norm"

ADJ<-matrix(runif(nNodes*nNodes),ncol=nNodes)

ADJ = (ADJ + t(ADJ))/2;

diag(ADJ) = 0;

results<-propensityClustering(
              adjacency = ADJ,
              objectiveFunction = objective,
              initialClusters = NULL,
              nClusters = nClusters,
              fastUpdates = FALSE)

table(results$Clustering)



