library(GROAN)


### Name: noiseInjector.swapper
### Title: Swap phenotypes between samples
### Aliases: noiseInjector.swapper

### ** Examples

#a set of phenotypes
phenos = 1:10
#swapping two elements
phenos.sw2 = noiseInjector.swapper(phenos, 0.2)
#swapping four elements
phenos.sw4 = noiseInjector.swapper(phenos, 0.4)
#swapping four elements again, since 30% of 10 elements
#is rounded to 4 (two couples)
phenos.sw4.again = noiseInjector.swapper(phenos, 0.3)



