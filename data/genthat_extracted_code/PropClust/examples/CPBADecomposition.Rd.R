library(PropClust)


### Name: CPBADecomposition
### Title: Cluster and Propensity-based Approximation decomposition for
###   adajcency matrixes.
### Aliases: CPBADecomposition
### Keywords: misc

### ** Examples


nNodes=50
nClusters=5
#We would like to use L2Norm instead of Loglikelihood
objective = "L2norm"

ADJ<-matrix(runif(nNodes*nNodes),ncol=nNodes)
for(i in 1:(length(ADJ[1,])-1)){
		for(j in i:length(ADJ[,1])){
			ADJ[i,j]=ADJ[j,i]
		}
	}

for(i in 1:length(ADJ[1,])) ADJ[i,i]=0 

Results<-propensityClustering(
              adjacency = ADJ,
              objectiveFunction = objective,
              initialClusters = NULL,
              nClusters = nClusters,
              fastUpdates = FALSE)

Results2<-CPBADecomposition(adjacency = ADJ, clustering = Results$Clustering, 
                            objectiveFunction = objective)

Results3<-propensityClustering( adjacency = ADJ,
              objectiveFunction = objective,
              initialClusters = NULL,
              nClusters = nClusters,
              fastUpdates = TRUE)




