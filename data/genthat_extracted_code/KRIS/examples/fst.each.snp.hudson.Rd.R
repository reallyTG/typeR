library(KRIS)


### Name: fst.each.snp.hudson
### Title: Calculate the fixation index (Fst) for all SNPs between two
###   groups of individuals from Single-nucleotide polymorphism (SNP)
### Aliases: fst.each.snp.hudson

### ** Examples



#Load simulated dataset
data(example_SNP)

idx1 <- which(sample_labels == 'pop1')
idx2 <- which(sample_labels == 'pop2')
fst.pairwise <- fst.each.snp.hudson(simsnp$snp, idx1, idx2)

#Print out the Fst values of the first three SNPs between 'pop1' and 'pop2'
print(fst.pairwise[1:3])




