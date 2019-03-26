library(tigger)


### Name: inferGenotypeBayesian
### Title: Infer a subject-specific genotype using a Bayesian approach
### Aliases: inferGenotypeBayesian

### ** Examples

# Infer IGHV genotype, using only unmutated sequences, including novel alleles
inferGenotypeBayesian(SampleDb, germline_db=GermlineIGHV, novel=SampleNovel, 
                      find_unmutated=TRUE)




