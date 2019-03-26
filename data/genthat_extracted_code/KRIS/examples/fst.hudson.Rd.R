library(KRIS)


### Name: fst.hudson
### Title: Calculate the average fixation index (Fst) between two groups of
###   individuals from Single-nucleotide polymorphism (SNP)
### Aliases: fst.hudson

### ** Examples



#Load simulated dataset
data(example_SNP)

idx1 <- which(sample_labels == 'pop1')
idx2 <- which(sample_labels == 'pop2')
fst <- fst.hudson(simsnp$snp, idx1, idx2)

#Print out the Fst value between 'pop1' and 'pop2'
print(fst)




