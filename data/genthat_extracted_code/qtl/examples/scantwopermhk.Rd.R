library(qtl)


### Name: scantwopermhk
### Title: Permutation test for 2d genome scan by Haley-Knott regression
### Aliases: scantwopermhk
### Keywords: models

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=18:19)
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=5)
operm <- scantwopermhk(fake.f2, n.perm=2)
summary(operm, alpha=0.05)



