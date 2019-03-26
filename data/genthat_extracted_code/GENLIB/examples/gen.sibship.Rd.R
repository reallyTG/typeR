library(GENLIB)


### Name: gen.sibship
### Title: Get id numbers of siblings
### Aliases: gen.sibship
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
gen.sibship(genJi, individuals=21,halfSibling=TRUE) 


data(genea140) 
gen140<-gen.genealogy(genea140) 
sibs<-gen.sibship(gen140,individuals=10174, halfSibling=FALSE)
gen.graph(gen140, pro=c(10174,sibs))




