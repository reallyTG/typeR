library(qtl)


### Name: subset.scanoneperm
### Title: Subsetting permutation test results
### Aliases: subset.scanoneperm [.scanoneperm
### Keywords: manip

### ** Examples

data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=16:19)
## End(Don't show)
fake.bc <- calc.genoprob(fake.bc, step=5)
operm <- scanone(fake.bc, method="hk", pheno.col=1:2, n.perm=25)
operm2 <- subset(operm, lodcolumn=2)

# alternatively
operm2alt <- operm[,2]



