library(GENLIB)


### Name: gen.simuSet
### Title: Gene dropping simulations with specified transmission
###   probabilities
### Aliases: gen.simuSet
### Keywords: datagen

### ** Examples

## Not run: A case where only male subjects can receive alleles
data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
onlyThroughMale<-matrix(c(c(1,0.5,0,0.5,0.25,0,0,0,0,1,1,1,1,0.75,0.5,1,0.5,0), rep(1,18)), 
                        nrow=3, ncol=12) 
gen.graph(genJi, indVarAffected=c(28,27,25,17,12,8,4,1), varAffected=c(28,27,25,17,12,8,4,1))
simu_1000a<-gen.simuSet(genJi, pro=c(1,28), ancestors=c(17,25), stateAncestors=c(1,1), 
                        simulNo = 1000,probMatrix=onlyThroughMale)
## Not run: Number of alleles received by probants
table(simu_1000a)
## Not run: Number of alleles received by all probants at each simulation
table(colSums(simu_1000a))
## Not run: Number of alleles received by each probant
table(simu_1000a[1,],simu_1000a[2,])

## Not run: A case where subjects are limited to one copy compared to what is normally expected
max1Allreceived<-matrix(rep(c(1,0.5,0,0.5,0.25,0,0,0,0,1,1,1,1,1,1,1,1,1), 2) , nrow=3, ncol=12)  
gen.graph(genJi)
simu_1000b<-gen.simuSet(genJi, pro=c(1,29), ancestors=25, stateAncestors=1, simulNo=10000,
                        probMatrix=max1Allreceived)
## Not run: Normal case matrix not changed
simu_1000original<-gen.simuSet(genJi, pro=c(1,29), ancestors=25, stateAncestors=1, simulNo=10000)
## Not run: Number of alleles received by each probant
table(simu_1000b) 
table(simu_1000original) 
## Not run: Number of alleles received by all probants at each simulation
table(colSums(simu_1000b)) 
table(colSums(simu_1000original)) 
## Not run: Number of alleles received by each probant
table(simu_1000b[1,],simu_1000b[2,])
table(simu_1000original[1,],simu_1000original[2,]) 



