library(phangorn)


### Name: maxCladeCred
### Title: Maximum clade credibility tree
### Aliases: maxCladeCred
### Keywords: cluster

### ** Examples



data(Laurasiatherian)
set.seed(42)
bs <- bootstrap.phyDat(Laurasiatherian, FUN = function(x)upgma(dist.hamming(x)),
    bs=100)

strict_consensus <- consensus(bs)
majority_consensus <- consensus(bs, p=.5)
max_clade_cred <- maxCladeCred(bs)
par(mfrow = c(1,3), mar = c(1,4,1,1))
plot(strict_consensus, main="Strict consensus tree")
plot(majority_consensus, main="Majority consensus tree")
plot(max_clade_cred, main="Maximum clade credibility tree")

# compute clade credibility for trees given a prop.part object
pp <- prop.part(bs)
tree <- rNNI(bs[[1]], 20)
maxCladeCred(c(tree, bs[[1]]), tree=FALSE, part = pp)
# first value likely be -Inf




