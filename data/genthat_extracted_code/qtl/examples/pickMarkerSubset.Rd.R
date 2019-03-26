library(qtl)


### Name: pickMarkerSubset
### Title: Identify the largest subset of markers that are some distance
###   apart
### Aliases: pickMarkerSubset
### Keywords: manip

### ** Examples

data(hyper)

# subset of markers on chr 4 spaced >= 5 cM
pickMarkerSubset(pull.map(hyper)[[4]], 5)

# no. missing genotypes at each chr 4 marker
n.missing <- nmissing(subset(hyper, chr=4), what="mar")

# weight by -log(prop'n missing), but don't let 0 missing go to +Inf
wts <- -log( (n.missing+1) / (nind(hyper)+1) )

# subset of markers on chr 4 spaced >= 5 cM, with weights = -log(prop'n missing)
pickMarkerSubset(pull.map(hyper)[[4]], 5, wts)



