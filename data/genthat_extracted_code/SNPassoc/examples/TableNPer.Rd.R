library(SNPassoc)


### Name: Table.N.Per
### Title: Descriptive sample size and percentage
### Aliases: Table.N.Per
### Keywords: utilities

### ** Examples

data(SNPs)
#sample size and percentage of cases and controls for each genotype 
#  Table.N.Per(SNPs$snp10001,SNPs$casco)

# The same table for a subset (males)
#  Table.N.Per(SNPs$snp10001,SNPs$casco,SNPs$sex=="Male")

# The same table assuming a dominant model
#  Table.N.Per(dominant(snp(SNPs$snp10001,sep="")),SNPs$casco,SNPs$sex=="Male")





