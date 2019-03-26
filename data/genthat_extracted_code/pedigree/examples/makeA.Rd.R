library(pedigree)


### Name: makeA
### Title: Makes the A matrix for a part of a pedigree
### Aliases: makeA
### Keywords: utilities

### ** Examples

id <- 1:6
dam <- c(0,0,1,1,4,4)
sire <- c(0,0,2,2,3,5)
ped <- data.frame(id,dam,sire)
makeA(ped,which = c(rep(FALSE,4),rep(TRUE,2)))
A <- read.table("A.txt")



