library(pedigree)


### Name: countGen
### Title: Count generation number for each individual in a pedigree.
### Aliases: countGen
### Keywords: utilities

### ** Examples

id <- 1:5
dam <- c(0,0,1,1,4)
sire <- c(0,0,2,2,3)
ped <- data.frame(id,dam,sire)
(gens <- countGen(ped))



