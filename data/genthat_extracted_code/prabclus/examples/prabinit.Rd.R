library(prabclus)


### Name: prabinit
### Title: Presence-absence/abundance matrix initialization
### Aliases: prabinit print.prab prab
### Keywords: spatial cluster

### ** Examples

# If you want to use your own ASCII data files, use
# x <- prabinit(file="path/prabmatrixfile",
# neighborhood="path/neighborhoodfile")
data(kykladspecreg)
data(nb)
prabinit(prabmatrix=kykladspecreg, neighborhood=nb)



