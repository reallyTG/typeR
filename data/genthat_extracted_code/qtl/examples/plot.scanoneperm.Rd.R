library(qtl)


### Name: plot.scanoneperm
### Title: Plot permutation results for a single-QTL genome scan
### Aliases: plot.scanoneperm
### Keywords: hplot

### ** Examples

data(fake.bc)
fake.bc <- calc.genoprob(fake.bc)

operm <- scanone(fake.bc, method="hk", n.perm=100)
plot(operm)



