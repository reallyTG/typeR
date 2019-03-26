library(GENLIB)


### Name: gen.implex
### Title: Genealogical implex
### Aliases: gen.implex
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
gen.implex(genJi)
gen.implex(genJi, type="IND")
## Not run: For the 5th generation
gen.implex(genJi, type="IND", genNo=5) 

## No test: 
data(genea140) 
gen140<-gen.genealogy(genea140) 
gen.implex(gen140)
gen.implex(gen140, pro=c(454422, 676521, 677273, 717537, 717634, 717709, 868572))
gen.implex(gen140, pro=c(454422, 676521, 677273, 717537, 717634, 717709, 868572), type="IND")
## End(No test)



