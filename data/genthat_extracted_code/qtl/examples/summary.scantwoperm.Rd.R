library(qtl)


### Name: summary.scantwoperm
### Title: LOD thresholds from scantwo permutation results
### Aliases: summary.scantwoperm
### Keywords: print

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(18:19,"X"), ind=1:50)
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=0)

## Not run: operm <- scantwo(fake.f2, n.perm=100, method="hk")## Don't show: 
operm <- scantwo(fake.f2, n.perm=3, method="hk")
## End(Don't show)
summary(operm)



