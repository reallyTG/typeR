library(GENLIB)


### Name: gen.completenessVar
### Title: Variance of completeness index
### Aliases: gen.completenessVar
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
gen.completeness(genJi, type="IND")
gen.completenessVar(genJi)
## Not run: For the 4th generation
gen.completenessVar(genJi, genNo=4)

## No test: 
data(genea140) 
gen140<-gen.genealogy(genea140) 
gen.completeness(gen140)
gen.completenessVar(gen140)
## End(No test)



