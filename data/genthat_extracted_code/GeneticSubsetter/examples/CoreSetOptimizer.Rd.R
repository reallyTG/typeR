library(GeneticSubsetter)


### Name: CoreSetOptimizer
### Title: Subset Optimization
### Aliases: CoreSetOptimizer
### Keywords: misc

### ** Examples

data("genotypes")
CoreSetOptimizer(genotypes,subset=colnames(genotypes)[c(1,3,5,7,8,9)],
    criterion="HET",save=colnames(genotypes)[c(1,5,9)])
CoreSetOptimizer(genotypes,subset=colnames(genotypes)[c(1,3,5,7,8,9)],
    criterion="MTK",save=colnames(genotypes)[c(1,5,9)])



