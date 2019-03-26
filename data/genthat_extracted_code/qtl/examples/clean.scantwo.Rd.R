library(qtl)


### Name: clean.scantwo
### Title: Clean up scantwo output
### Aliases: clean.scantwo
### Keywords: manip

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=18:19)
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=5)
out2 <- scantwo(fake.f2, method="hk")
out2 <- clean(out2)
out2cl2 <- clean(out2, n.mar=2, distance=5)



