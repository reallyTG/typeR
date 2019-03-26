library(growthrates)


### Name: bactgrowth
### Title: Plate Reader Data of Bacterial Growth
### Aliases: bactgrowth
### Keywords: data

### ** Examples

## plot data and determine growth rates
data(bactgrowth)


library(lattice)
xyplot(value ~ time | strain + as.factor(conc),
      data = bactgrowth, groups = replicate)



