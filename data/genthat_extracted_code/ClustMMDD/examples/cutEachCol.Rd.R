library(ClustMMDD)


### Name: cutEachCol
### Title: Retrieve data from strings in the dataset.
### Aliases: cutEachCol
### Keywords: Genotype data

### ** Examples

data(genotype1)
head(genotype1) 
genotype2 = cutEachCol(genotype1[,-11], ploidy = 2)
head(genotype2)



