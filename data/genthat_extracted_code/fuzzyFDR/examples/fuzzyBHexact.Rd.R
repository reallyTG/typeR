library(fuzzyFDR)


### Name: fuzzyBHexact
### Title: Exact calculation of fuzzy decision rules (Benjamini and
###   Hochberg FDR)
### Aliases: fuzzyBHexact
### Keywords: htest

### ** Examples

data(example1)
names(example1)
fuzzyBHexact(example1$pvals,example1$pprev,alpha=0.05)
data(example2)
names(example2)
fuzzyBHexact(example2$pvals,example2$pprev,alpha=0.05)



