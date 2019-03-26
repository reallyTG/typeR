library(hierfstat)


### Name: getal.b
### Title: Converts diploid genotypic data into allelic data
### Aliases: getal.b
### Keywords: manip

### ** Examples

data(gtrunchier)
#multilocus diploid genotype of the first individual
gtrunchier[1,-c(1:2)]
#the diploid genotype splitted in its two constituent alleles
getal.b(gtrunchier[,-c(1:2)])[1,,]



