library(rres)


### Name: recode.snpdata
### Title: Recode SNP marker data.
### Aliases: recode.snpdata

### ** Examples

test.dat = matrix(c(3,4,4,3), 4, 10)

# treat test.dat as 4 input haplotypes of two subjects at 10 SNP markers,
# output recoded data as haplotypes
recode.snpdata(test.dat, input.haplotype = TRUE, output.haplotype = TRUE)

# treat test.dat as 4 input haplotypes of two subjects at 10 SNP markers,
# output recoded data as counts of reference alleles
recode.snpdata(test.dat, input.haplotype = TRUE, output.allele = FALSE)
#'
# treat test.dat as allelic types at 5 SNPs of 4 subjects,
# output recoded data as haplotypes
recode.snpdata(test.dat, output.haplotype = TRUE)



