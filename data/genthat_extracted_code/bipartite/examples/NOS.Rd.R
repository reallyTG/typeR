library(bipartite)


### Name: NOS
### Title: Calculates the node overlap and separation according to Strona &
###   Veech (2015)
### Aliases: NOS
### Keywords: package

### ** Examples

data(Safariland)
# illustrate difference between keeping/removing the diagonal:
NOS(Safariland)
NOS(Safariland, keep.diag=TRUE)



