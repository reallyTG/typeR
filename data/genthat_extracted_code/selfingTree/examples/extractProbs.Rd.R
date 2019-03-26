library(selfingTree)


### Name: extractProbs
### Title: Extracts conditional genotype probabilities
### Aliases: extractProbs

### ** Examples


probs.2M <- extractProbs(genSubtree.2M("BA","AA"))
probs.3M <- extractProbs(genSubtree.3M("BAA","AAB"))

## must sum to 1
stopifnot(all.equal(evalProb(probs.2M, z = 0.044),1))
stopifnot(all.equal(evalProb(probs.3M, x = 0.123, y = 0.344),1))




