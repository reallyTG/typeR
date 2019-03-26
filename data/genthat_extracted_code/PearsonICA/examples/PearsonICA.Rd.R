library(PearsonICA)


### Name: PearsonICA
### Title: Pearson-ICA algorithm for independent component analysis (ICA)
### Aliases: PearsonICA
### Keywords: multivariate ts neural

### ** Examples

S<-matrix(runif(5000),1000,5);
X<-S+S[,c(2,3,4,5,1)];
icaresults<-PearsonICA(X,verbose=TRUE)
print(icaresults$A)



