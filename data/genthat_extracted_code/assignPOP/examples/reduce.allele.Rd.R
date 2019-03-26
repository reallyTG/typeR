library(assignPOP)


### Name: reduce.allele
### Title: Remove low variance alleles (dimensionality reduction)
### Aliases: reduce.allele

### ** Examples

genin <- read.Genepop(system.file("extdata/TinyGenepop.txt", package="assignPOP"))
reduce_infile <- reduce.allele(genin, p = 0.95)
#Change file 'TinyGenepop' to 'simGenepop' to get the example used in the tutorial.



