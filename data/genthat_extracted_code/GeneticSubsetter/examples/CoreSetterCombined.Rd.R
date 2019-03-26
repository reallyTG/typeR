library(GeneticSubsetter)


### Name: CoreSetterCombined
### Title: Genotype Subsetting-Alternative Method
### Aliases: CoreSetterCombined
### Keywords: misc

### ** Examples

data("genotypes")
CoreSetterCombined(genotypes,size=6,criterion="HET",permutations=10,
    save=colnames(genotypes)[c(1,5,9)])
CoreSetterCombined(genotypes,size=6,criterion="MTK",permutations=10,
    save=colnames(genotypes)[c(1,5,9)])



