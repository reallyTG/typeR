library(qtl)


### Name: plot.scantwoperm
### Title: Plot permutation results for a 2d, 2-QTL genome scan
### Aliases: plot.scantwoperm
### Keywords: hplot

### ** Examples

data(fake.bc)
fake.bc <- calc.genoprob(fake.bc)

operm2 <- scantwo(fake.bc, method="hk", n.perm=10)
plot(operm2)



