library(QuantumClone)


### Name: Probability.to.belong.to.clone
### Title: Probability
### Aliases: Probability.to.belong.to.clone
### Keywords: Clonal inference phylogeny

### ** Examples

set.seed(123)
SNVs<-QuantumCat(number_of_clones = 2,number_of_mutations = 50,number_of_samples = 1,ploidy = "AB")
Probability.to.belong.to.clone(SNV_list=SNVs,
clone_prevalence=list(c(0.5,1),c(0.5,1)),contamination=c(0,0))



