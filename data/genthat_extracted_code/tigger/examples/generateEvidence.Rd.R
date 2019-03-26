library(tigger)


### Name: generateEvidence
### Title: Generate evidence
### Aliases: generateEvidence

### ** Examples

## No test: 
# Generate input data
novel <- findNovelAlleles(SampleDb, GermlineIGHV)
genotype <- inferGenotype(SampleDb, find_unmutated=TRUE, germline_db=GermlineIGHV,
                          novel=novel)
genotype_db <- genotypeFasta(genotype, GermlineIGHV, novel)
data_db <- reassignAlleles(SampleDb, genotype_db)

# Assemble evidence table
evidence <- generateEvidence(data_db, novel, genotype, genotype_db, GermlineIGHV)
## End(No test)




