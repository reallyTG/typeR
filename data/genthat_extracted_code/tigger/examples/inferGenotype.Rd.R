library(tigger)


### Name: inferGenotype
### Title: Infer a subject-specific genotype using a frequency method
### Aliases: inferGenotype

### ** Examples

# Infer IGHV genotype, using only unmutated sequences, including novel alleles
inferGenotype(SampleDb, germline_db=GermlineIGHV, novel=SampleNovel,
              find_unmutated=TRUE)




