library(qtl)


### Name: subset.scantwoperm
### Title: Subsetting two-dimensional permutation test results
### Aliases: subset.scantwoperm [.scantwoperm
### Keywords: manip

### ** Examples

data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=18:19)
## End(Don't show)
fake.bc <- calc.genoprob(fake.bc, step=0)
operm <- scantwo(fake.bc, method="hk", pheno.col=1:2, n.perm=5)
operm2 <- subset(operm, lodcolumn=2)

# alternatively
operm2alt <- operm[,2]



