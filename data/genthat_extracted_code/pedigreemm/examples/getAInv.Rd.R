library(pedigreemm)


### Name: getAInv
### Title: Inverse of the relationship matrix
### Aliases: getAInv
### Keywords: array algebra

### ** Examples


## Example from chapter 2 of Mrode (2005)

ped <- pedigree(sire = c(NA,NA,1, 1,4,5),
                dam  = c(NA,NA,2,NA,3,2), label= 1:6)
getAInv(ped)



