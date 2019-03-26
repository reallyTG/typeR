library(GENLIB)


### Name: gen.meangendepth
### Title: Expected Genealogical Depth
### Aliases: gen.meangendepth
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
gen.meangendepth(genJi)
gen.meangendepth(genJi, type="IND")


data(genea140) 
gen140<-gen.genealogy(genea140) 
gen.meangendepth(gen140)
gen.meangendepth(gen140, pro=c(454422, 676521, 677273, 717537, 717634, 717709, 868572))
gen.meangendepth(gen140, pro=c(454422, 676521, 677273, 717537, 717634, 717709, 868572), type="IND")




