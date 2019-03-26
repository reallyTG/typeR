library(pedigreemm)


### Name: inbreeding
### Title: Inbreeding coefficients from a pedigree...
### Aliases: inbreeding
### Keywords: misc

### ** Examples

ped <- pedigree(sire = c(NA,NA,1, 1,4,5),
                dam  = c(NA,NA,2,NA,3,2), label= 1:6)
inbreeding(ped)



