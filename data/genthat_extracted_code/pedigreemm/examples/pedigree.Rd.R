library(pedigreemm)


### Name: pedigree
### Title: Pedigree Constructor
### Aliases: pedigree
### Keywords: misc

### ** Examples

example("pedigree-class") ## 'p1' pedigree object `the hard way'

ped <- pedigree(sire = c(NA,NA,1, 1,4,5),
                dam  = c(NA,NA,2,NA,3,2), label= 1:6)
## note that 'label' is coerced to character automatically
ped
stopifnot(identical(ped, p1))



