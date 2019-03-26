library(growthrates)


### Name: names.growthmodel
### Title: Get Names Attributes of Growth Models
### Aliases: names.growthmodel names,multiple_fits-method
###   names<-,multiple_fits-method

### ** Examples


## growthmodel-method
names(grow_baranyi)

## multiple_fits-method
L <- all_splines(value ~ time | strain + conc + replicate,
       data = bactgrowth)

names(L)

## plot only the 'R' strain
par(mfrow=c(4, 6))
plot(L[grep("R:", names(L))])





