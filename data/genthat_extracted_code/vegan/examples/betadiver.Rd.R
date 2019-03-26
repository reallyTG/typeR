library(vegan)


### Name: betadiver
### Title: Indices of beta Diversity
### Aliases: betadiver scores.betadiver plot.betadiver
### Keywords: multivariate

### ** Examples

## Raw data and plotting
data(sipoo)
m <- betadiver(sipoo)
plot(m)
## The indices
betadiver(help=TRUE)
## The basic Whittaker index
d <- betadiver(sipoo, "w")
## This should be equal to Sorensen index (binary Bray-Curtis in
## vegan)
range(d - vegdist(sipoo, binary=TRUE))



