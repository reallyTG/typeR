library(GENLIB)


### Name: gen.simuProb
### Title: Gene dropping simulations - Probabilities
### Aliases: gen.simuProb
### Keywords: datagen

### ** Examples

data(geneaJi) 
genJi<-gen.genealogy(geneaJi) 
## Not run: Probability that subjects 1 and 29 get 1 and 2 alleles from ancestors 20 and 25,
## Not run:  that have themselves 2 and 1.
gen.simuProb(genJi, pro=c(1,29), statePro=c(1,2), ancestors=c(20,25), stateAncestors=c(2,1),
             simulNo=10000)
## Not run: Probability that subjects 1 and 29 get 1 segment from ancestors 25, 
## Not run:  knowing the segment has a male 
## Not run:  recombination rate of 0.02 and a female recombination rate of 0.04.
gen.simuProb(genJi, pro=c(1,29), statePro=c(1,1), ancestors=c(25), stateAncestors=c(1),
             simulNo=10000, probRecomb = c(0.02, 0.04))
## Not run: Probability that subjects 1 and 29 get 1 and 2 alleles from ancestors 20 and 25, 
## Not run:  that have themselves 2 and 1 and knowing that homozygous people have a survival rate 
## Not run:  of 0.50.
gen.simuProb(genJi, pro=c(1,29), statePro=c(1,2), ancestors=c(20,25), stateAncestors=c(2,1),
             simulNo=10000, probSurvival=0.5)




