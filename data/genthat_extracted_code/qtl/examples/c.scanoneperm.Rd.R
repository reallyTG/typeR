library(qtl)


### Name: c.scanoneperm
### Title: Combine data from scanone permutations
### Aliases: c.scanoneperm rbind.scanoneperm
### Keywords: manip

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(18:19,"X"))
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2)
operm1 <- scanone(fake.f2, method="hk", n.perm=100, perm.Xsp=TRUE)
operm2 <- scanone(fake.f2, method="hk", n.perm=50, perm.Xsp=TRUE)

operm <- c(operm1, operm2)



