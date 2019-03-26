library(iRafNet)


### Name: iRafNet_permutation
### Title: Derive importance scores for one permuted data.
### Aliases: iRafNet_permutation

### ** Examples


  # --- Generate data sets
  n<-20                  # sample size
  p<-5                   # number of genes
  genes.name<-paste("G",seq(1,p),sep="")   # genes name
  data<-matrix(rnorm(p*n),n,p)       # generate expression matrix
  W<-abs(matrix(rnorm(p*p),p,p))     # generate weights for regulatory relationships
 
  # --- Standardize variables to mean 0 and variance 1
  data <- (apply(data, 2, function(x) { (x - mean(x)) / sd(x) } ))

  # --- Run iRafNet and obtain importance score of regulatory relationships
  out.iRafNet<-iRafNet(data,W,mtry=round(sqrt(p-1)),ntree=1000,genes.name)

  # --- Run iRafNet for one permuted data set and obtain importance scores
  out.perm<-iRafNet_permutation(data,W,mtry=round(sqrt(p-1)),ntree=1000,genes.name,perm=1)




