library(GENLIB)


### Name: gen.children
### Title: Get id numbers of children
### Aliases: gen.children
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
gen.children(genJi, individuals=14) 

data(genea140) 
gen140<-gen.genealogy(genea140) 
children51052<-gen.children(gen140,51052)
gen.graph(gen140, pro=c(children51052))



