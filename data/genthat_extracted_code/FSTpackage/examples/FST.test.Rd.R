library(FSTpackage)


### Name: FST.test
### Title: Test the association between an quantitative/dichotomous outcome
###   variable and a gene by a score type test allowing for multiple
###   functional annotation scores.
### Aliases: FST.test
### Keywords: test

### ** Examples

## FST.prelim does the preliminary data management.
# Input: Y, X (covariates)
## FST.test tests a region.
# Input: G (genetic variants), Z (functional annotation scores) and result of FST.prelim

library(FSTpackage)

# Load data example
# Y: outcomes, n by 1 matrix where n is the total number of observations
# X: covariates, n by d matrix
# G: genotype matrix, n by p matrix where n is the total number of subjects
# Z: functional annotation matrix, p by q matrix

data(FST.example)
Y<-FST.example$Y;X<-FST.example$X;G<-FST.example$G;Z<-FST.example$Z

# Preliminary data management
result.prelim<-FST.prelim(Y,X=X,out_type='D')

# test with 5000 bootstrap replicates
result<-FST.test(result.prelim,G,Z,B=5000)



