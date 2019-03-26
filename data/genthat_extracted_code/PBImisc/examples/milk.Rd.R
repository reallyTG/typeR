library(PBImisc)


### Name: milk
### Title: Milk yield data
### Aliases: milk
### Keywords: milk

### ** Examples

data(milk)
library(lattice)
# change the order of levels
milk$cow = reorder(milk$cow, milk$milk.amount, mean)
#plot it
dotplot(cow~milk.amount, data=milk)



