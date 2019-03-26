library(qtl)


### Name: cbind.scanoneperm
### Title: Combine columns from multiple scanone permutation results
### Aliases: cbind.scanoneperm
### Keywords: manip

### ** Examples

data(fake.f2)
fake.f2 <- calc.genoprob(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(18:19,"X"))
## End(Don't show)
operm1 <- scanone(fake.f2, method="hk", n.perm=10, perm.Xsp=TRUE)
operm2 <- scanone(fake.f2, method="em", n.perm=5, perm.Xsp=TRUE)

operm <- cbind(operm1, operm2, labels=c("hk","em"))
summary(operm)



