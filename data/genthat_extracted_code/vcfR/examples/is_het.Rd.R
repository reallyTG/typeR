library(vcfR)


### Name: is_het
### Title: Query genotypes for heterozygotes
### Aliases: is_het is.het

### ** Examples

data(vcfR_test)
gt <- extract.gt(vcfR_test)
hets <- is_het(gt)
# Censor non-heterozygous positions.
is.na(vcfR_test@gt[,-1][!hets]) <- TRUE




