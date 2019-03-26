library(qtl)


### Name: calc.penalties
### Title: Calculate LOD penalties
### Aliases: calc.penalties
### Keywords: utilities

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=18:19)
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=5)
out.2dim <- scantwo(fake.f2, method="hk")

# permutations
## Don't show: 
permo.2dim <- scantwo(fake.f2, method="hk", n.perm=2)
## End(Don't show)
## Not run: permo.2dim <- scantwo(fake.f2, method="hk", n.perm=1000)
summary(permo.2dim, alpha=0.05)

# penalties
calc.penalties(permo.2dim)



