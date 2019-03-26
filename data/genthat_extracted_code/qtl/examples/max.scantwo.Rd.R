library(qtl)


### Name: max.scantwo
### Title: Maximum peak in two-dimensional genome scan
### Aliases: max.scantwo
### Keywords: print

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=18:19)
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=10)
out.2dim <- scantwo(fake.f2, method="hk")
max(out.2dim)



