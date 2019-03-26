library(vcfR)


### Name: extract.gt
### Title: Extract elements from vcfR objects
### Aliases: extract.gt extract.haps extract.indels extract.info

### ** Examples

data(vcfR_test)
gt <- extract.gt(vcfR_test)
gt <- extract.gt(vcfR_test, return.alleles = TRUE)

data(vcfR_test)
getFIX(vcfR_test)
vcf <- extract.indels(vcfR_test)
getFIX(vcf)
vcf@fix[nrow(vcf@fix),'ALT'] <- ".,A"
vcf <- extract.indels(vcf)
getFIX(vcf)

data(vcfR_test)
vcfR_test@fix[1,'ALT'] <- "<NON_REF>"
vcf <- extract.indels(vcfR_test)
getFIX(vcf)

data(vcfR_test)
extract.haps(vcfR_test, unphased_as_NA = FALSE)
extract.haps(vcfR_test)





