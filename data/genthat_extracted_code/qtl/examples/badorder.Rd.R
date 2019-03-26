library(qtl)


### Name: badorder
### Title: An intercross with misplaced markers
### Aliases: badorder
### Keywords: datasets

### ** Examples

data(badorder)
## Don't show: 
badorder <- subset(badorder,chr=1)
## End(Don't show)
# estimate recombination fractions
badorder <- est.rf(badorder)
plotRF(badorder)

# re-estimate map
newmap <- est.map(badorder)
plotMap(badorder, newmap)

# assess marker order on chr 1
rip3 <- ripple(badorder, chr=1, window=3)
summary(rip3)



