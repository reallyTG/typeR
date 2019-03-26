library(pedigree)


### Name: calcInbreeding
### Title: Calculates inbreeding coefficients for individuals in a
###   pedigree.
### Aliases: calcInbreeding
### Keywords: utilities

### ** Examples

id <- 1:6
dam <- c(0,0,1,1,4,4)
sire <- c(0,0,2,2,3,5)
ped <- data.frame(id,dam,sire)
(F <- calcInbreeding(ped))



