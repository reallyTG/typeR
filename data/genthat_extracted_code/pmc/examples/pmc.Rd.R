library(pmc)


### Name: pmc
### Title: pmc
### Aliases: pmc pmc pmc-package

### ** Examples

library("geiger")
geo=get(data(geospiza))
tmp=treedata(geo$phy, geo$dat)
phy=tmp$phy
dat=tmp$data[,1]
## No test: 
 
pmc(phy, dat, "BM", "lambda", nboot = 20, mc.cores=1)
## End(No test)



