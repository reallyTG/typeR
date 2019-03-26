library(lmf)


### Name: nearPD
### Title: Find nearest positive definite matrix
### Aliases: nearPD

### ** Examples

#Simulated non-positive definite (PD) matrix
nonPD <- matrix(c(2.04e-03, 3.54e-05, 7.52e-03, 3.54e-05, 6.15e-07,
  1.30e-04, 7.52e-03, 1.30e-04, 2.76e-02), ncol = 3)
#View eigenvalues (PD = only positive eigenvalues)
eigen(nonPD)
#Calculate PD matrix
PD <- nearPD(nonPD, only.matrix = TRUE)
PD
#View eigenvalues
eigen(PD)
#More thorough examples are given in the help pages for nearPD
 #in the Matrix package.



