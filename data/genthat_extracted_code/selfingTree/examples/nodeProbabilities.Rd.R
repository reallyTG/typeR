library(selfingTree)


### Name: nodeProbabilities
### Title: Multiplies conditional probabilities along all branches of the
###   tree
### Aliases: nodeProbabilities

### ** Examples


## F2 and F3 genotypes
node.probs <- nodeProbabilities(buildSelfingTree(genSubtree.2M,3,"AA","BB"),3)

## must sum to 1
stopifnot(all.equal(evalProb(node.probs[["F2"]],z = 0.045),1))
stopifnot(all.equal(evalProb(node.probs[["F3"]],z = 0.045),1))




