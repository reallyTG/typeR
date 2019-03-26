library(gaston)


### Name: Tests
### Title: Evaluation of a condition on SNPS or individuals in a
###   'bed.matrix'
### Aliases: test.inds test.snps which.inds which.snps

### ** Examples

# Load data
data(LCT)
x <- as.bed.matrix(LCT.gen, LCT.fam, LCT.bim)

# SNPs and individuals with a callrate < 100%
w <- test.snps(x, callrate < 1)
table(w)
which.snps(x, callrate < 1)
which.inds(x, callrate < 1)



