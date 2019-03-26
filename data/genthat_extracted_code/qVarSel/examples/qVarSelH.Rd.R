library(qVarSel)


### Name: qVarSelH
### Title: Selection of Variables for Clustering or Data Dimension
###   Reduction
### Aliases: qVarSelH
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


## Calculate two prototype, using kmeans
y <- kmeans(a, 2, iter.max = 200, nstart = 10)
p = y$centers

## Calculate dist:
d <- PrtDist(a, p)
           
## Calculate Best 10 variables:
lsH <- qVarSelH(d, 10, maxit = 200)




