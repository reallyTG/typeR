library(sparcl)


### Name: HierarchicalSparseCluster
### Title: Hierarchical sparse clustering
### Aliases: HierarchicalSparseCluster print.HierarchicalSparseCluster
###   plot.HierarchicalSparseCluster

### ** Examples

  # Generate 2-class data
  set.seed(1)
  x <- matrix(rnorm(100*50),ncol=50)
  y <- c(rep(1,50),rep(2,50))
  x[y==1,1:25] <- x[y==1,1:25]+2
  # Do tuning parameter selection for sparse hierarchical clustering
  perm.out <- HierarchicalSparseCluster.permute(x, wbounds=c(1.5,2:6),
nperms=5)
  print(perm.out)
  plot(perm.out)
  # Perform sparse hierarchical clustering
  sparsehc <- HierarchicalSparseCluster(dists=perm.out$dists,
wbound=perm.out$bestw, method="complete")
  # faster than   sparsehc <- HierarchicalSparseCluster(x=x,wbound=perm.out$bestw, 
#  method="complete")
  par(mfrow=c(1,2))
  plot(sparsehc)
  plot(sparsehc$hc, labels=rep("", length(y)))
  print(sparsehc)
  # Plot using knowledge of class labels in order to compare true class
  #   labels to clustering obtained
  par(mfrow=c(1,1))
  ColorDendrogram(sparsehc$hc,y=y,main="My Simulated Data",branchlength=.007)
  # Now, what if we want to see if out data contains a *secondary*
  #   clustering after accounting for the first one obtained. We
  #   look for a complementary sparse clustering:
  sparsehc.comp <- HierarchicalSparseCluster(x,wbound=perm.out$bestw,
     method="complete",uorth=sparsehc$u)
  # Redo the analysis, but this time use "absolute value" dissimilarity:
  perm.out <- HierarchicalSparseCluster.permute(x, wbounds=c(1.5,2:6),
    nperms=5, dissimilarity="absolute.value")
  print(perm.out)
  plot(perm.out)
  # Perform sparse hierarchical clustering
  sparsehc <- HierarchicalSparseCluster(dists=perm.out$dists, wbound=perm.out$bestw, 
method="complete",
 dissimilarity="absolute.value")
  par(mfrow=c(1,2))
  plot(sparsehc)



