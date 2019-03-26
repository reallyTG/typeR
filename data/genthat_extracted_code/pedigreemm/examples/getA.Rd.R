library(pedigreemm)


### Name: getA
### Title: Additive Relationship Matrix
### Aliases: getA
### Keywords: array algebra

### ** Examples


## Example from chapter 2 of Mrode (2005)

ped <- pedigree(sire = c(NA,NA,1, 1,4,5),
                dam  = c(NA,NA,2,NA,3,2), label= 1:6)
(getA(ped))



