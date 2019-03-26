library(ClustMMDD)


### Name: selectK.R
### Title: Selection of the number K of clusters.
### Aliases: selectK.R
### Keywords: Unsupervized classification Clustering EM SEM CEM

### ** Examples

data(genotype1)
head(genotype1)
genotype2 = cutEachCol(genotype1[, -11], ploidy = 2)
head(genotype2)
S = c(rep(TRUE, 8), rep(FALSE, 2))
## Not run: 
##D outPut = selectK.R(genotype2, S, Kmax = 6, ploidy = 2, Kmin=1)
##D outPut[["BIC"]]
##D 
##D file.remove("genotype2_ExploredModels.txt")
## End(Not run)


