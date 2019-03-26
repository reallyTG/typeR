library(LGEWIS)


### Name: GEI.test
### Title: Test the interaction between an environemental exposure and a
###   region/gene by a generalized score type test.
### Aliases: GEI.test
### Keywords: test

### ** Examples

## GEI.prelim does the preliminary data management.
# Input: Y, time, E, X (covariates)
## GEI.test tests a region.
# Input: G (genetic variants) and result of GEI.prelim

library(LGEWIS)

# Load data example
# Y: outcomes, n by 1 matrix where n is the total number of observations
# X: covariates, n by p matrix
# E: environmental exposure, n by 1 matrix
# time: describe longitudinal structure, n by 2 matrix
# G: genotype matrix, m by q matrix where m is the total number of subjects

data(LGEWIS.example)
Y<-LGEWIS.example$Y
X<-LGEWIS.example$X
E<-LGEWIS.example$E
time<-LGEWIS.example$time
G<-LGEWIS.example$G

# Preliminary data management
result.prelim<-GEI.prelim(Y,time,E,X=X)

# test without the MinP test
result<-GEI.test(result.prelim,G,MinP.adjust=NULL)

# test with the MinP test
result<-GEI.test(result.prelim,G,MinP.adjust=0.95)

# test with the MinP test and the small sample adjustment
result<-GEI.test(result.prelim,G,MinP.adjust=0.95,bootstrap=1000)



