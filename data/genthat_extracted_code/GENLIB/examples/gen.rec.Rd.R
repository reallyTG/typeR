library(GENLIB)


### Name: gen.rec
### Title: Ancestors coverage
### Aliases: gen.rec
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
## Not run: Number of probands which are descendants of an ancestor
gen.rec(genJi)


data(genea140) 
gen140<-gen.genealogy(genea140) 
gen.rec(gen140, ancestors=c(18305, 18528, 31114, 18325))



