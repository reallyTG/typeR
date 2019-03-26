library(partitionComparison)


### Name: entropy
### Title: Entropy
### Aliases: entropy entropy,numeric,numeric-method
###   entropy,Partition,numeric-method entropy,ANY,missing-method

### ** Examples

isTRUE(all.equal(entropy(c(.5, .5)), log(2)))
isTRUE(all.equal(entropy(c(.5, .5), 2), 1))
isTRUE(all.equal(entropy(c(.5, .5), 4), .5))

# Entropy of a partition
isTRUE(all.equal(entropy(new("Partition", c(0, 0, 1, 1, 1))), entropy(c(2/5, 3/5))))




