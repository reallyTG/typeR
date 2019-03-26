library(GenoScan)


### Name: GenoScan.prelim
### Title: The preliminary data management for GenoScan
### Aliases: GenoScan.prelim
### Keywords: preliminary work

### ** Examples

library(GenoScan)

# Load data example
# Y: outcomes, n by 1 matrix where n is the total number of observations
# X: covariates, n by d matrix
# G: genotype matrix, n by p matrix where n is the total number of subjects
# Z: functional annotation matrix, p by q matrix

data(GenoScan.example)
Y<-GenoScan.example$Y;X<-GenoScan.example$X;G<-GenoScan.example$G;Z<-GenoScan.example$Z

# Preliminary data management
result.prelim<-GenoScan.prelim(Y,X=X,out_type="C",B=5000)




