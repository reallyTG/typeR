library(qtl)


### Name: cbind.scantwoperm
### Title: Combine scantwo permutations by column
### Aliases: cbind.scantwoperm
### Keywords: manip

### ** Examples

data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=c(18:19), ind=1:50)
## End(Don't show)
fake.bc <- calc.genoprob(fake.bc)
## Not run: 
##D operm1 <- scantwo(fake.bc, pheno.col=1, method="hk", n.perm=50)
##D operm2 <- scantwo(fake.bc, pheno.col=2, method="hk", n.perm=50)
## End(Not run)## Don't show: 
operm1 <- scantwo(fake.bc, pheno.col=1, method="hk", n.perm=3)
operm2 <- scantwo(fake.bc, pheno.col=2, method="hk", n.perm=3)
## End(Don't show)

operm <- cbind(operm1, operm2)



