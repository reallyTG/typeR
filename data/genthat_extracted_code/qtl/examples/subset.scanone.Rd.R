library(qtl)


### Name: subset.scanone
### Title: Subsetting the results of a genome scan
### Aliases: subset.scanone
### Keywords: manip

### ** Examples

data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=16:19)
## End(Don't show)
fake.bc <- calc.genoprob(fake.bc, step=2.5)
out <- scanone(fake.bc, method="hk", pheno.col=1:2)

summary(subset(out, chr=18:19), format="allpeaks")



