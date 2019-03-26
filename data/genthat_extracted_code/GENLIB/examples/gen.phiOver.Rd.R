library(GENLIB)


### Name: gen.phiOver
### Title: Kinship above threshold
### Aliases: gen.phiOver
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
kinship<-gen.phi(genJi)
gen.phiOver(kinship, 0.1)

## No test: 
data(genea140) 
gen140<-gen.genealogy(genea140) 
phi9subj<-gen.phi(gen140,pro=c(408758,408950,409082,409111,676521,717537,717634,717709,868572))
gen.phiOver(phi9subj,0.025)
## End(No test)



