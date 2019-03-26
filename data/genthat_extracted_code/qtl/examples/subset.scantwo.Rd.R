library(qtl)


### Name: subset.scantwo
### Title: Subsetting the results of a 2-d genome scan
### Aliases: subset.scantwo
### Keywords: manip

### ** Examples

data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=16:19)
## End(Don't show)
fake.bc <- calc.genoprob(fake.bc)
out <- scantwo(fake.bc, method="hk", pheno.col=1:2)

summary(subset(out, chr=18:19))



