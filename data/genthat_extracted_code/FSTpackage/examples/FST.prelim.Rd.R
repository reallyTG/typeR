library(FSTpackage)


### Name: FST.prelim
### Title: The preliminary data management for FST (functional score tests)
### Aliases: FST.prelim
### Keywords: preliminary work

### ** Examples

library(FSTpackage)

# Load data example
# Y: outcomes, n by 1 matrix where n is the total number of observations
# X: covariates, n by d matrix
# G: genotype matrix, n by p matrix where n is the total number of subjects
# Z: functional annotation matrix, p by q matrix

data(FST.example)
Y<-FST.example$Y;X<-FST.example$X;G<-FST.example$G

# Preliminary data management
result.prelim<-FST.prelim(Y,X=X)




