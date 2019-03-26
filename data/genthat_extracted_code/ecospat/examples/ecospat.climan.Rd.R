library(ecospat)


### Name: ecospat.climan
### Title: A climate analogy setection tool for the modeling of species
###   distributions
### Aliases: ecospat.climan

### ** Examples

x <- ecospat.testData[c(4:8)]
p<- x[1:90,] #A projection dataset.
ref<- x[91:300,] #A reference dataset
ecospat.climan(ref,p)




