library(iRafNet)


### Name: iRafNet_network
### Title: Compute permutation-based FDR of importance scores and return
###   estimated regulations.
### Aliases: iRafNet_network

### ** Examples


  # --- Generate data sets
  n<-20           # sample size 
  p<-5            # number of genes
  genes.name<-paste("G",seq(1,p),sep="")   # genes name
  M=5;            # number of permutations
  data<-matrix(rnorm(p*n),n,p)       # generate gene expression matrix
  data[,1]<-data[,2]                 # var 1 and var 2 interact
  W<-abs(matrix(rnorm(p*p),p,p))     # generate weights for regulatory relationships
  
  # --- Standardize variables to mean 0 and variance 1
  data <- (apply(data, 2, function(x) { (x - mean(x)) / sd(x) } ))

  # --- Run iRafNet and obtain importance score of regulatory relationships
  out.iRafNet<-iRafNet(data,W,mtry=round(sqrt(p-1)),ntree=1000,genes.name)

  # --- Run iRafNet for M permuted data sets
  out.perm<-Run_permutation(data,W,mtry=round(sqrt(p-1)),ntree=1000,genes.name,M)

  # --- Derive final networks
  final.net<-iRafNet_network(out.iRafNet,out.perm,0.001)




