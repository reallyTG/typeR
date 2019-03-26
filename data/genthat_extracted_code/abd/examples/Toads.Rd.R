library(abd)


### Name: Toads
### Title: Right-handed Toads
### Aliases: Toads
### Keywords: datasets

### ** Examples

Toads
# generate this data manually
cbind(0:18, dbinom(0:18, 18, 0.5))
xyplot(prob ~ n.toads, Toads, type = 'h', lwd = 4)
barchart(prob ~ n.toads, Toads, origin=0, horizontal=FALSE)
plotDist('binom', params = list(18,0.5), kind = 'hist')



