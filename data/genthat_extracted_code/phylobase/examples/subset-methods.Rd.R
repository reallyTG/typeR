library(phylobase)


### Name: subset-methods
### Title: Methods for creating subsets of phylogenies
### Aliases: subset-methods subset subset,phylo4-method [
###   [,phylo4,character,missing,missing-method
###   [,phylo4,numeric,missing,missing-method
###   [,phylo4,logical,missing,missing-method
###   [,phylo4,missing,missing,missing-method
###   [,phylo4d,ANY,character,missing-method
###   [,phylo4d,ANY,numeric,missing-method
###   [,phylo4d,ANY,logical,missing-method [,phylo4,ANY,ANY,ANY-method
###   prune prune,phylo4-method prune,phylo4d-method
### Keywords: methods

### ** Examples

data(geospiza)
nodeLabels(geospiza) <- paste("N", nodeId(geospiza, "internal"), sep="")
geotree <- extractTree(geospiza)

## "subset" examples
tips <- c("difficilis", "fortis", "fuliginosa", "fusca", "olivacea",
    "pallida", "parvulus", "scandens")
plot(subset(geotree, tips.include=tips))
plot(subset(geotree, tips.include=tips, trim.internal=FALSE))
plot(subset(geotree, tips.exclude="scandens"))
plot(subset(geotree, mrca=c("scandens","fortis","pauper")))
plot(subset(geotree, node.subtree=18))

## "prune" examples (equivalent to subset using tips.exclude)
plot(prune(geotree, tips))

## "[" examples (equivalent to subset using tips.include)
plot(geotree[c(1:6,14)])
plot(geospiza[c(1:6,14)])

## for phylo4d, subset both tips and data columns
geospiza[c(1:6,14), c("wingL", "beakD")]

## note handling of root edge length:
edgeLength(geotree)['0-15'] <- 0.1
geotree2 <- geotree[1:2]
## in subset tree, edge of new root extends back to the original root
edgeLength(geotree2)['0-3']
## edge length immediately ancestral to this node in the original tree
edgeLength(geotree, MRCA(geotree, tipLabels(geotree2)))



