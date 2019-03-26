library(pedigree)


### Name: add.Inds
### Title: Function to add missing individuals to a pedigree
### Aliases: add.Inds
### Keywords: utilities

### ** Examples

ID <- 3:5
DAM <- c(1,1,3)
SIRE <- c(2,2,4)
pedigree <- data.frame(ID,DAM,SIRE)
pedigree <- add.Inds(pedigree)



