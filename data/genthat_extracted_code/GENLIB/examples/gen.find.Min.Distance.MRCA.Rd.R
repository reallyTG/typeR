library(GENLIB)


### Name: gen.find.Min.Distance.MRCA
### Title: Finds the minimum distances between pairs of individuals given a
###   set of ancestors.
### Aliases: gen.find.Min.Distance.MRCA
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
matMRCA<-gen.findMRCA(genJi, individuals=c(1,29), NbProcess = 1)
gen.find.Min.Distance.MRCA(matMRCA)

## No test: 
## Not run: Increasing NbProcess will decrease execution time
data(genea140) 
gen140<-gen.genealogy(genea140) 
matMRCA<-gen.findMRCA(gen140, individuals=c(409033,408728,408828), NbProcess = 1)
gen.find.Min.Distance.MRCA(matMRCA, individuals=c(409033,408728))
## End(No test)



