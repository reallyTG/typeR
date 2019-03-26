library(qtl)


### Name: plotRF
### Title: Plot recombination fractions
### Aliases: plotRF
### Keywords: hplot

### ** Examples

data(badorder)
badorder <- est.rf(badorder)
plotRF(badorder)

# plot just chr 1
plotRF(badorder, chr=1)

# plot just the recombination fractions
plotRF(badorder, what="rf")

# plot just the LOD scores, and just for chr 2 and 3
plotRF(badorder, chr=2:3, what="lod")



