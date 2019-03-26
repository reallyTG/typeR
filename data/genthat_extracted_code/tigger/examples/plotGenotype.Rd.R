library(tigger)


### Name: plotGenotype
### Title: Show a colorful representation of a genotype
### Aliases: plotGenotype

### ** Examples

# Plot genotype
plotGenotype(SampleGenotype)

# Facet by subject
genotype_a <- genotype_b <- SampleGenotype
genotype_a$SUBJECT <- "A"
genotype_b$SUBJECT <- "B"
geno_sub <- rbind(genotype_a, genotype_b)
plotGenotype(geno_sub, facet_by="SUBJECT", gene_sort="pos")




