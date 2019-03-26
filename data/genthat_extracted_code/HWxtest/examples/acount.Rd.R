library(HWxtest)


### Name: acount
### Title: Find Approximate Number of Genotype Tables
### Aliases: acount

### ** Examples

# Allele counts from human Rh locus. Guo and Thompson, 1992, Figure 1
#
alleles <- c(15, 14, 11, 12, 2, 2, 1, 3)
acount(alleles)
# This approximation may be compared with the exact value of 250552020
#
ld <- c(6329, 319, 47, 2773, 75, 6702, 14, 2, 333)
acount(ld)
#
# This is an example where the number of tables is too large for a full enumeration.




