library(iRafNet)


### Name: iRafNet
### Title: Integrative random forest for gene regulatory network inference
### Aliases: iRafNet

### ** Examples


  # --- Generate data sets
  n<-20                  # sample size
  p<-5                   # number of genes
  genes.name<-paste("G",seq(1,p),sep="")   # genes name
  data<-matrix(rnorm(p*n),n,p)      # generate expression matrix
  W<-abs(matrix(rnorm(p*p),p,p))    # generate weights for regulatory relationships
 
  # --- Standardize variables to mean 0 and variance 1
  data <- (apply(data, 2, function(x) { (x - mean(x)) / sd(x) } ))

  # --- Run iRafNet and obtain importance score of regulatory relationships
  out<-iRafNet(data,W,mtry=round(sqrt(p-1)),ntree=1000,genes.name)




