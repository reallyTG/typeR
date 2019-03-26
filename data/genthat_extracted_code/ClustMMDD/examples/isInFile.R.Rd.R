library(ClustMMDD)


### Name: isInFile.R
### Title: Find a model in a file.
### Aliases: isInFile.R

### ** Examples

data(genotype1)
head(genotype1) 
genotype2 = cutEachCol(genotype1[, -11], ploidy = 2)
head(genotype2)

S = c(rep(TRUE, 8), rep(FALSE, 2))
## Not run: 
##D outPut = selectK.R(genotype2, S, Kmax = 6, ploidy = 2, Kmin=1)
##D isInFile.R(K = 5, S, "genotype2_ExploredModels.txt", header = TRUE)
##D isInFile.R(K = 5, rep(TRUE, 10), "genotype2_ExploredModels.txt", header = TRUE)
##D 
##D file.remove("genotype2_ExploredModels.txt")
## End(Not run)


