library(HardyWeinberg)


### Name: HWTriExact
### Title: Exact test for Hardy-Weinberg equilibrium and equality of allele
###   frequencies for tri-allelic variants.
### Aliases: HWTriExact
### Keywords: misc

### ** Examples

#
# Autosomal tri-allelic (not accounting for gender)
#

x <- c(AA=20,AB=31,AC=26,BB=15,BC=12,CC=0)
## Not run: out <- HWTriExact(x)

#
# Autosomal tri-allelic accounting for gender
#

males   <- c(A=1,B=21,C=34) 
females <- c(AA=0,AB=1,AC=0,BB=8,BC=24,CC=15)
## Not run: out <- HWTriExact(females,males)

#
# X-chromosomal tri-allelic accounting for gender
#

males   <- c(A=1,B=21,C=34) 
females <- c(AA=0,AB=1,AC=0,BB=8,BC=24,CC=15)
## Not run: out <- HWTriExact(females,males)



