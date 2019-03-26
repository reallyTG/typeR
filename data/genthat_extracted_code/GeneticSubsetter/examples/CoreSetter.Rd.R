library(GeneticSubsetter)


### Name: CoreSetter
### Title: Genotype Subsetting
### Aliases: CoreSetter
### Keywords: misc

### ** Examples

data("genotypes")
CoreSetter(genotypes,criterion="HET",save=colnames(genotypes)[c(1,5,9)])
CoreSetter(genotypes,criterion="MTK",save=colnames(genotypes)[c(1,5,9)])



