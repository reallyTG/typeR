library(LGEWIS)


### Name: GA.test
### Title: Test the association between an quantitative outcome variable
###   and a region/gene by a generalized score type test.
### Aliases: GA.test
### Keywords: test

### ** Examples

## GA.prelim does the preliminary data management.
# Input: Y, time, X (covariates)
## GA.test tests a region.
# Input: G (genetic variants) and result of GEI.prelim

library(LGEWIS)

# Load data example
# Y: outcomes, n by 1 matrix where n is the total number of observations
# X: covariates, n by p matrix
# time: describe longitudinal structure, n by 2 matrix
# G: genotype matrix, m by q matrix where m is the total number of subjects

data(LGEWIS.example)
Y<-LGEWIS.example$Y
X<-LGEWIS.example$X
time<-LGEWIS.example$time
G<-LGEWIS.example$G

# Preliminary data management
result.prelim<-GA.prelim(Y,time,X=X)

# test with 5000 bootstrap replicates
result<-GA.test(result.prelim,G,B=5000)



