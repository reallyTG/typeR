library(GENLIB)


### Name: gen.implexVar
### Title: Variance of genealogical implex
### Aliases: gen.implexVar
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
gen.implex(genJi, type="IND")
gen.implexVar(genJi)
## Not run: For the 5th generation
gen.implexVar(genJi, genNo=5)

## No test: 
data(genea140) 
gen140<-gen.genealogy(genea140) 
gen.implex(gen140)
gen.implex(gen140, pro=c(454422, 676521, 677273, 717537, 717634, 717709, 868572), type="IND")
gen.implexVar(gen140, pro=c(454422, 676521, 677273, 717537, 717634, 717709, 868572), type="IND")
## End(No test)



