library(ClustMMDD)


### Name: genotype2
### Title: A genotype data frame compatible with 'ClustMMDD' main
###   functions.
### Aliases: genotype2
### Keywords: Genotype Genotype data Alleles

### ** Examples

data(genotype2)
head(genotype2)
data(genotype1)
genotype3 = cutEachCol(genotype1[,-11], ploidy = 2)
head(genotype3)



