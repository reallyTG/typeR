library(fuzzyFDR)


### Name: fuzzyFDR-package
### Title: Exact calculation of fuzzy decision rules for multiple testing
### Aliases: fuzzyFDR-package fuzzyFDR
### Keywords: package

### ** Examples

data(example1)
names(example1)
fuzzyBHexact(example1$pvals,example1$pprev,alpha=0.05)
data(example2)
names(example2)
fuzzyBHexact(example2$pvals,example2$pprev,alpha=0.05)



