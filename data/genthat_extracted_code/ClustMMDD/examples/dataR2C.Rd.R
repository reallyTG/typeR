library(ClustMMDD)


### Name: dataR2C
### Title: Transform a (normal) data frame to be compatible with
###   'ClustMMDD' main functions
### Aliases: dataR2C

### ** Examples

data(genotype1)
head(genotype1)
genotype2 = cutEachCol(genotype1[, -11], 2)
head(genotype2)
genotype3 = dataR2C(genotype2, ploidy = 2)
head (genotype3$data)
str(genotype3)



