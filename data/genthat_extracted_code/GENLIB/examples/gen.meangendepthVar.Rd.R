library(GENLIB)


### Name: gen.meangendepthVar
### Title: Variance of genealogical depth
### Aliases: gen.meangendepthVar
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
gen.meangendepth(genJi, type="IND")
gen.meangendepthVar(genJi, type="IND")
gen.meangendepthVar(genJi, type="MEAN")

data(genea140) 
gen140<-gen.genealogy(genea140) 
gen.meangendepth(gen140)
probands <- c(454422,676521,677273,717537,717634,717709,868572)
gen.meangendepth(gen140, pro=probands)
gen.meangendepthVar(gen140, pro=probands)
gen.meangendepthVar(gen140, pro=probands, type="MEAN")

## No test: 
gen.meangendepth(gen140, pro=probands, type="IND")
gen.meangendepthVar(gen140, pro=probands, type="IND")
## End(No test)



