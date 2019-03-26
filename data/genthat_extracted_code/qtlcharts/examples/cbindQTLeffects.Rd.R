library(qtlcharts)


### Name: cbindQTLeffects
### Title: Combine multiple runs of estQTLeffects
### Aliases: cbindQTLeffects
### Keywords: utilities

### ** Examples

library(qtl)
data(fake.f2)
fake.f2 <- calc.genoprob(fake.f2)
sex <- fake.f2$pheno$sex
eff.fem <- estQTLeffects(fake.f2[,sex==0], pheno.col=1)
eff.mal <- estQTLeffects(fake.f2[,sex==1], pheno.col=1)
eff <- cbindQTLeffects(eff.fem, eff.mal, labels=c("female", "male"))




