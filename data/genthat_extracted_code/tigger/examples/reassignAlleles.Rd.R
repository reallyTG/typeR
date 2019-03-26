library(tigger)


### Name: reassignAlleles
### Title: Correct allele calls based on a personalized genotype
### Aliases: reassignAlleles

### ** Examples

# Extract the database sequences that correspond to the genotype
genotype_db <- genotypeFasta(SampleGenotype, GermlineIGHV, novel=SampleNovel)

# Use the personlized genotype to determine corrected allele assignments
output_db <- reassignAlleles(SampleDb, genotype_db)




