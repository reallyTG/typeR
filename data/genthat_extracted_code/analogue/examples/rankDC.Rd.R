library(analogue)


### Name: rankDC
### Title: Rank correlation between environmental and species
###   dissimilarities.
### Aliases: rankDC print.rankDC plot.rankDC dotplot.rankDC dotplot
### Keywords: hplot methods utilities multivariate

### ** Examples

data(swappH)
data(swapdiat)

rc <- rankDC(swappH, swapdiat, dc = c("chord","euclidean","gower"))

## base plot uses dotchart()
plot(rc)

## lattice version of the base plot
dotplot(rc)




