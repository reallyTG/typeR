library(qVarSel)


### Name: PrtDist
### Title: Calculation of the distances between units and centers
### Aliases: PrtDist
### Keywords: classif cluster optimize

### ** Examples

## Generate random 2 cluster with 20 masking variables
## and 10 true variables
  
require(clusterGeneration)
tmp1 <- genRandomClust(numClust = 2, sepVal = 0.2, clustszind = 2,
                         rangeN = c( 100, 150 ),
                         numNonNoisy = 10, numNoisy = 20, numReplicate = 1, 
                         fileName = "chk1")
a <- tmp1$datList$chk1_1
a <- scale(a)  # Standardize for column


## Calculate two prototypes, using kmeans
y <- kmeans(a, 2, iter.max = 200, nstart = 10)
p = y$centers

## Calculate dist:
d <- PrtDist(a, p)



