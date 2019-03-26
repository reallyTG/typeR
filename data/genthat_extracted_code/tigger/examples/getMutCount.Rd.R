library(tigger)


### Name: getMutCount
### Title: Determine the mutation counts from allele calls
### Aliases: getMutCount

### ** Examples

# Insert a mutation into a germline sequence
s2 <- s3 <- GermlineIGHV[1]
stringi::stri_sub(s2, 103, 103) <- "G"
stringi::stri_sub(s3, 107, 107) <- "C"

sample_seqs <- c(GermlineIGHV[2], s2, s3)

# Pretend that one sample sequence has received an ambiguous allele call
sample_alleles <- c(paste(names(GermlineIGHV[1:2]), collapse=","),
                    names(GermlineIGHV[2]),
                    names(GermlineIGHV[1]))

# Compare each sequence to its assigned germline(s) to determine the distance
getMutCount(sample_seqs, sample_alleles, GermlineIGHV)




