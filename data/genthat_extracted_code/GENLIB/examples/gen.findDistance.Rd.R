library(GENLIB)


### Name: gen.findDistance
### Title: Minimum genetic distance between two individuals
### Aliases: gen.findDistance
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
gen.findDistance(genJi, individuals=c(1,29), ancestor=17)
gen.findDistance(genJi, individuals=c(1,29), ancestor=26)

data(genea140) 
gen140<-gen.genealogy(genea140) 
gen.findDistance(gen140, individuals=c(409033,408728), ancestor=38714)
gen.findDistance(gen140, individuals=c(408728,408828), ancestor=95080)






