library(sparseBC)


### Name: sparseBC.BIC
### Title: Do tuning parameter (lambda) selection for sparse biclustering
###   via BIC criterion
### Aliases: sparseBC.BIC

### ** Examples

########### Create data matrix
x <- matrix(rnorm(20*30),nrow=20,ncol=30)

########### Perform sparseBC.BIC to select lambda
lambda<-sparseBC.BIC(x,k=2,r=2,lambda=c(0,10,20,30,40))$lambda 



