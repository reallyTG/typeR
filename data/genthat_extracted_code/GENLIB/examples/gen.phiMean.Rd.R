library(GENLIB)


### Name: gen.phiMean
### Title: Average kinship
### Aliases: gen.phiMean
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
kinship<-gen.phi(genJi)
gen.phiMean(kinship)

## No test: 
data(genea140) 
gen140<-gen.genealogy(genea140) 
phi6subjects<-gen.phi(gen140, pro=c(454422, 676521, 677273, 717537, 717634, 717709, 868572))
gen.phiMean(phi6subjects)
## End(No test)



