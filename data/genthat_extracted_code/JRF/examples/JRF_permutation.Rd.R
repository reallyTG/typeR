library(JRF)


### Name: JRF_permutation
### Title: Derive importance scores for permuted data.
### Aliases: JRF_permutation

### ** Examples


 # --- Derive weighted networks via JRF
 
 nclasses=2               # number of data sets / classes
 n1<-n2<-20               # sample size for each data sets
 p<-5                   # number of variables (genes)
 genes.name<-paste("G",seq(1,p),sep="")   # genes name
 perm=1;        # set permutation seed
 
   # --- Generate data sets
 
 data1<-matrix(rnorm(p*n1),p,n1)       # generate data1
 data2<-matrix(rnorm(p*n2),p,n1)       # generate data2
 
   # --- Standardize variables to mean 0 and variance 1
   
  data1 <- t(apply(data1, 1, function(x) { (x - mean(x)) / sd(x) } ))
  data2 <- t(apply(data2, 1, function(x) { (x - mean(x)) / sd(x) } ))
   
   # --- Run JRF and obtain importance score of interactions for each class
   
  out<-JRF_permutation(list(data1,data2),mtry=round(sqrt(p-1)),ntree=1000,genes.name,perm)




