library(sparcl)


### Name: HierarchicalSparseCluster.permute
### Title: Choose tuning parameter for sparse hierarchical clustering
### Aliases: HierarchicalSparseCluster.permute
###   print.HierarchicalSparseCluster.permute
###   plot.HierarchicalSparseCluster.permute

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
  sparsehc <- HierarchicalSparseCluster(dists=perm.out$dists, wbound=perm.out$bestw, 
method="complete")
  par(mfrow=c(1,2))
  plot(sparsehc)
  plot(sparsehc$hc, labels=rep("", length(y)))
  print(sparsehc)
  # Plot using knowledge of class labels in order to compare true class
  #   labels to clustering obtained
  par(mfrow=c(1,1))
  ColorDendrogram(sparsehc$hc,y=y,main="My Simulated
Data",branchlength=.007)



