library(ClustMMDD)


### Name: backward.explorer
### Title: Gather a set of the most competitive models.
### Aliases: backward.explorer
### Keywords: Backward-stepwise selection Variable selection in Clustering
###   EM

### ** Examples

data(genotype1)
head(genotype1) 
genotype2 = cutEachCol(genotype1[, -11], ploidy = 2)
head(genotype2)

# The following command create a file "genotype2_ExploredModels.txt" 
# that contains the most competitive models.

#output = backward.explorer(genotype2, Kmax = 10, ploidy = 2, Kmin = 1, Criterion = "CteDim")

data(genotype2_ExploredModels)
head(genotype2_ExploredModels)



