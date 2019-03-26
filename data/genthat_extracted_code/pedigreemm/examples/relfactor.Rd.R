library(pedigreemm)


### Name: relfactor
### Title: Relationship factor from a pedigree...
### Aliases: relfactor
### Keywords: array algebra

### ** Examples


## Example from chapter 2 of Mrode (2005)

ped <- pedigree(sire = c(NA,NA,1, 1,4,5),
                dam  = c(NA,NA,2,NA,3,2), label= 1:6)
(fac <- relfactor(ped))
crossprod(fac)    # the relationship matrix
getA(ped)         # the relationship matrix 



