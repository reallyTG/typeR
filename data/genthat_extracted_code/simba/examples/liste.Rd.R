library(simba)


### Name: liste
### Title: Convert dist-objects and matrices to database format
### Aliases: liste
### Keywords: manip

### ** Examples


data(abis)
## there are empty species entries:
sum(colSums(abis.spec)==0)
## remove empty species
abis.spec <- abis.spec[,colSums(abis.spec)!=0]
abis.spec.ls <- liste(abis.spec, splist=TRUE)




