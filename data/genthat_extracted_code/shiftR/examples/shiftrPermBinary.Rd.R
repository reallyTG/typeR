library(shiftR)


### Name: shiftrPermBinary
### Title: Fast Enrichment Testing on Binary Outcomes via Circular
###   Permutations
### Aliases: shiftrPermBinary

### ** Examples

### Number of features
nf = 1e6
npermute = 10000

### Generate data sets
# The vector of a few common active feature to create dependence
common = sample(c(0L,1L), size = nf, replace = TRUE, prob = c(0.999,0.001))

# Left and right data sets with the common active features
lset = sample(c(0L,1L), size = nf, replace = TRUE, prob = c(0.8,0.2)) | common
rset = sample(c(0L,1L), size = nf, replace = TRUE, prob = c(0.8,0.2)) | common

offsets = getOffsetsUniform(n = nf, npermute = npermute)

show(head(offsets))
show(tail(offsets))

z = shiftrPermBinary(lset, rset, offsets)

show(z)



