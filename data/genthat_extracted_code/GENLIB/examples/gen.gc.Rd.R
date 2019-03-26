library(GENLIB)


### Name: gen.gc
### Title: Genetic contribution of ancestors
### Aliases: gen.gc
### Keywords: manip

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
gc<-gen.gc(genJi, pro=c(1,29), ancestors=c(3,6,10,12,14,16,18,20,26,28))
gc
gc_cum<-gen.gc(genJi, pro=c(1,29), ancestors=c(3,6,10,12,14,16,18,20,26,28), type="CUMUL")
gc_cum

data(genea140) 
gen140<-gen.genealogy(genea140) 
gc<-gen.gc(gen140, pro=c(454422,676521,677273,717537,717634,717709,868572), 
           ancestors=c(18305,18528,31114,18325))
gc
## Not run: Mother-daughter transmission only with probability=0.5
gc_MoLi<-gen.gc(gen140, pro=c(217891,302718,409282,802424,409682,443151),
		ancestors=c(18321,218231,296200,39066,18679,442607),vctProb=c(0,0,0,0.5))
gc_MoLi



