library(SNFtool)


### Name: affinityMatrix
### Title: Affinity matrix calculation
### Aliases: affinityMatrix

### ** Examples


## First, set all the parameters:
K = 20; ##number of neighbors, must be greater than 1. usually (10~30)
alpha = 0.5; ##hyperparameter, usually (0.3~0.8)
T = 20; ###Number of Iterations, usually (10~50)

## Data1 is of size n x d_1, 
## where n is the number of patients, d_1 is the number of genes, 
## Data2 is of size n x d_2, 
## where n is the number of patients, d_2 is the number of methylation
data(Data1)
data(Data2)

## Calculate distance matrices(here we calculate Euclidean Distance, 
## you can use other distance, e.g. correlation)
Dist1 = (dist2(as.matrix(Data1),as.matrix(Data1)))^(1/2)
Dist2 = (dist2(as.matrix(Data2),as.matrix(Data2)))^(1/2)

## Next, construct similarity graphs
W1 = affinityMatrix(Dist1, K, alpha)
W2 = affinityMatrix(Dist2, K, alpha)




