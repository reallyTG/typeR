library(SNPassoc)


### Name: Table.mean.se
### Title: Descriptive sample size, mean, and standard error
### Aliases: Table.mean.se
### Keywords: utilities

### ** Examples

data(SNPs)
# sample size, mean age and standard error for each genotype
#  Table.mean.se(SNPs$snp10001,SNPs$protein)

# The same table for a subset (males)
#  Table.mean.se(SNPs$snp10001,SNPs$protein,SNPs$sex=="Male")

# The same table assuming a dominant model
#  Table.mean.se(dominant(snp(SNPs$snp10001,sep="")),SNPs$protein,SNPs$sex=="Male")





