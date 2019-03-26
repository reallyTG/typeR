library(Claddis)


### Name: SafeTaxonomicReduction
### Title: Safe Taxonomic Reduction
### Aliases: SafeTaxonomicReduction
### Keywords: Reduction Safe Taxonomic

### ** Examples


# Performs STR on the Gauthier 1986 dataset used in Wilkinson (1995):
str.out <- SafeTaxonomicReduction(Gauthier1986)

# View deleted taxa:
str.out$str.list

# View reduced matrix:
str.out$reduced.matrix

# View removed matrix:
str.out$removed.matrix




