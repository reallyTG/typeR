library(RClone)


### Name: sample_LU
### Title: Sample Loci or Units
### Aliases: sample_loci sample_units sample_loci_core sample_units_core
###   sample_LU
### Keywords: documentation

### ** Examples

data(posidonia)

sample_loci(posidonia, nbrepeat = 10, graph = TRUE)[[2]]
sample_units(posidonia, nbrepeat = 10, graph = TRUE, bar = TRUE, He = TRUE)[[1]]

#Graph :
res <- sample_loci(posidonia, nbrepeat = 100)
boxplot(res$raw_MLG, range = 3, ylab = "Number of multilocus genotypes", 
xlab = "Number of loci sampled")
title(paste("Genotype accumulation curve for", "posidonia"))



