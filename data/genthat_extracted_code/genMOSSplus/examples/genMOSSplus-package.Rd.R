library(genMOSSplus)


### Name: genMOSSplus-package
### Title: Application of MOSS algorithm to dense SNP array data
### Aliases: genMOSSplus-package genMOSSplus
### Keywords: htest models

### ** Examples

m <- as.data.frame(matrix(round(runif(100)), 5))
write.table(m, file="randbinary.txt", col.names=FALSE, row.names=FALSE, quote=FALSE, sep="\t")
run1.moss(filename="randbinary.txt", replicates=1, maxVars=3, k=2)
try(system("rm randbinary.txt*"))



