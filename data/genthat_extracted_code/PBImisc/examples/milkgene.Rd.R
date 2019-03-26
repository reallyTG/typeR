library(PBImisc)


### Name: milkgene
### Title: Mutation in BTN3A1 gene and milk yield
### Aliases: milkgene
### Keywords: milk

### ** Examples

data(milkgene)
library(lattice)
xyplot(milk~fat, data=milkgene)
bwplot(milk~lactation, data=milkgene)



