library(GENLIB)


### Name: gen.completeness
### Title: Completeness
### Aliases: gen.completeness
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
gen.completeness(genJi, type="IND")
## Not run: For the 4th generation
gen.completeness(genJi, type="IND", genNo=4)

data(genea140) 
gen140<-gen.genealogy(genea140) 
gen.completeness(gen140)




