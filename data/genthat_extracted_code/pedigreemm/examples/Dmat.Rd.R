library(pedigreemm)


### Name: Dmat
### Title: vector of the diagonal for the D matrix from the decomposition
###   A= TDT'
### Aliases: Dmat
### Keywords: misc

### ** Examples

ped <- pedigree(sire = c(NA,NA,1, 1,4,5),
                dam  = c(NA,NA,2,NA,3,2), label= 1:6)
Dmat(ped)



