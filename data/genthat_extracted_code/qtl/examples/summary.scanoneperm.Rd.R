library(qtl)


### Name: summary.scanoneperm
### Title: LOD thresholds from scanone permutation results
### Aliases: summary.scanoneperm
### Keywords: print

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(18:19,"X"))
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=2.5)

operm1 <- scanone(fake.f2, n.perm=100, method="hk")
summary(operm1)

operm2 <- scanone(fake.f2, n.perm=100, method="hk", perm.Xsp=TRUE)
summary(operm2)

# Add noise column
fake.f2$pheno$noise <- rnorm(nind(fake.f2))
operm3 <- scanone(fake.f2, pheno.col=c("phenotype", "noise"), n.perm=10, method="hk")
summary(operm3)
summary(operm3, controlAcrossCol=TRUE, alpha=c(0.05, 0.36))



