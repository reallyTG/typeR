library(GENLIB)


### Name: gen.occ
### Title: Ancestor occurences
### Aliases: gen.occ
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
## Not run: Number of occurences of ancestors in the specified proband's genealogy
gen.occ(genJi, pro=c(1,29), ancestors=c(3,6,10,12,14,16,18,20,26,28))

data(genea140) 
gen140<-gen.genealogy(genea140) 
gen.occ(gen140, pro=c(454422,676521,677273,717537,717634,717709,868572), 
        ancestors=c(18305,18528,31114,18325))




