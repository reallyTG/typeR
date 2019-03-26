library(pedigree)


### Name: orderPed
### Title: Orders a pedigree
### Aliases: orderPed
### Keywords: utilities

### ** Examples

id <- 1:6
dam <- c(0,0,1,1,4,4)
sire <- c(0,0,2,2,3,5)
pedigree <- data.frame(id,dam,sire)
(ord <- orderPed(pedigree))
pedigree <- pedigree[6:1,]
(ord <- orderPed(pedigree))
pedigree <- pedigree[order(ord),]
pwrong <- pedigree
pwrong[1,2] <- pwrong[6,1]



