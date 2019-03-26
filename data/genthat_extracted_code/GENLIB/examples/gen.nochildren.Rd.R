library(GENLIB)


### Name: gen.nochildren
### Title: Number of children
### Aliases: gen.nochildren
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
gen.children(genJi,14)
gen.nochildren(genJi,individuals=c(1,12,14,20))

data(genea140) 
gen140<-gen.genealogy(genea140) 
children51052<-gen.children(gen140,51052)
gen.nochildren(gen140,51052)
gen.graph(gen140, pro=children51052)



