library(qtlcharts)


### Name: ipleiotropy
### Title: Tool to explore pleiotropy
### Aliases: ipleiotropy
### Keywords: hplot

### ** Examples

library(qtl)
data(fake.bc)
fake.bc <- calc.genoprob(fake.bc[5,], step=1) # select chr 5
out <- scanone(fake.bc, method="hk", pheno.col=1:2)
## No test: 
ipleiotropy(fake.bc, out)
## End(No test)

## No test: 
# omit the LOD curves
ipleiotropy(fake.bc)
## End(No test)




