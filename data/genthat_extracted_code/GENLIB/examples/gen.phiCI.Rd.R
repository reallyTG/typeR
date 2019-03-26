library(GENLIB)


### Name: gen.phiCI
### Title: Average kinship confidence interval
### Aliases: gen.phiCI
### Keywords: manip

### ** Examples

## No test: 
data(genea140)
gen140<-gen.genealogy(genea140)
ge07<-gen.branching(gen140, pro=gen.pro(gen140)[c(1:7)])
phiMat<-gen.phi(ge07)
gen.phiCI(phiMat)
## End(No test)



