library(GENLIB)


### Name: gen.simuSample
### Title: Gene dropping simulations - Sample
### Aliases: gen.simuSample
### Keywords: datagen

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
simu_1000<-gen.simuSample(genJi, pro=c(1,29), ancestors=c(20,25), stateAncestors=c(2,1),
                          simulNo=1000)
## Not run: Number of alleles received by probants
table(simu_1000)
## Not run: Number of alleles received by simulation
table(colSums(simu_1000))
## Not run: Number of alleles received by each probant
table(simu_1000[1,],simu_1000[2,])

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
simu_5000<-gen.simuSample(genJi, pro=c(1,29), ancestors=c(20,25), stateAncestors=c(2,1),
                          simulNo=5000)
## Not run: Number of alleles received by probants
table(simu_5000)
## Not run: Number of alleles received by simulation
table(colSums(simu_5000))
## Not run: Number of alleles received by each probant
table(simu_5000[1,],simu_5000[2,])




