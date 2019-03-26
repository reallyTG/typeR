library(pegas)


### Name: subset.haplotype
### Title: Subsetting and Filtering Haplotypes
### Aliases: subset.haplotype
### Keywords: manip

### ** Examples

data(woodmouse)
h <- haplotype(woodmouse)
subset(h, maxna = 20)
subset(h, maxna = 20/ncol(h)) # same thing than above



