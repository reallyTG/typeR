library(LGEWIS)


### Name: GA.prelim
### Title: The preliminary data management for GA (tests for genetic
###   association)
### Aliases: GA.prelim
### Keywords: preliminary work

### ** Examples

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



