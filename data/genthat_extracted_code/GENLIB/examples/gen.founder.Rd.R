library(GENLIB)


### Name: gen.founder
### Title: Get founder id numbers
### Aliases: gen.founder
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
## Not run: There are 6 founders
gen.founder(genJi)

data(genea140) 
gen140<-gen.genealogy(genea140)
founder140<-gen.founder(gen140)  
## Not run: There are 7399 founders
length(founder140)




