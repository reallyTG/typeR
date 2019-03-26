library(HardyWeinberg)


### Name: HWLRAllTests
### Title: Perform most relevant likelihood ratio test for Hardy-Weinberg
###   equilibrium and equality of allele frequencies
### Aliases: HWLRAllTests
### Keywords: misc

### ** Examples

males <- c(AA=11,AB=32,BB=13) 
females <- c(AA=14,AB=23,BB=11)
pvalues <- HWLRAllTests(males,females)
print(pvalues)



