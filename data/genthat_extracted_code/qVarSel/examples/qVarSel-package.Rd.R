library(qVarSel)


### Name: qVarSel-package
### Title: Selecting Variables for Clustering and Classification
### Aliases: qVarSel-package qVarSel
### Keywords: classif cluster optimize

### ** Examples


  # Generate random cluster with masking variables
  
  require(clusterGeneration)
  tmp1 <- genRandomClust(numClust = 4, sepVal = 0.2, clustszind = 2,
                         rangeN = c( 100, 150 ),
                         numNonNoisy = 5, numNoisy = 5, numReplicate = 1, 
                         fileName = "chk1")
  a <- tmp1$datList$chk1_1
  ass <- tmp1$memList$chk1_1
  numunits <- length(ass)
  noiseindex <- tmp1$noisyList$chk1_1
  a <- scale(a)  #Standardzation for columns
  
  # calculate data prototypes using k-means

  sl2 <- kmeans(a, 4, iter.max = 200, 
                      nstart = 10, algorithm = "L")
  prototype = sl2$centers
  
  # calculate distances between observations and prototypes
  # Remark: d is a 3-dimensions matrix
  
  d = PrtDist(a, prototype)
  
  # Select 5 most representative variables, use 200 iterations
  
  lsH <- qVarSelH(d, 5, maxit = 200)
  
  # reduce the dimension of a
  
  sq = 1:(dim(a)[2])
  vrb = sq[lsH$x > 0.01]
  a_reduced = a[ ,vrb]
  
  # use the EM methodology for clustering on the reduced data

  require(mclust)
  sl1 <- Mclust(a_reduced, G = 4, modelName = "VVV") 



