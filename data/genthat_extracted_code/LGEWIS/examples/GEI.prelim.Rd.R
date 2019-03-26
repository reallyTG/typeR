library(LGEWIS)


### Name: GEI.prelim
### Title: The preliminary data management for GEI (tests for
###   gene-environment interaction)
### Aliases: GEI.prelim
### Keywords: preliminary work

### ** Examples

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



