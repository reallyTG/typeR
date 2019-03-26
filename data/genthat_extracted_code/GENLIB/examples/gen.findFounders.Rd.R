library(GENLIB)


### Name: gen.findFounders
### Title: Find common founder ancestors
### Aliases: gen.findFounders
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
gen.founder(genJi)
gen.findFounders(genJi, individuals=c(1,29), NbProcess = 1)

data(genea140) 
gen140<-gen.genealogy(genea140) 
gen2<-gen.branching(gen140,pro=c(409033,408728)) 
## Not run: 615 founders in genealogy of #409033 and #408728
all_founders<-gen.founder(gen2) 
length(all_founders)

## No test: 
all_commonFounders<-gen.findFounders(gen140, individuals=c(409033,408728), NbProcess = 1)
length(all_commonFounders) ## Not run: 127 founders common to #409033 and #408728
## End(No test)



