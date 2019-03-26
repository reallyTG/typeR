library(adiv)


### Name: evodiss
### Title: Pair-wise Phylogenetic Dissimilarities between Communities
### Aliases: evodiss
### Keywords: models

### ** Examples

data(batcomm)
phy <- read.tree(text=batcomm$tre)
ab <- batcomm$ab[,phy$tip.label]

evodiss(phy, ab, "LG")
evodiss(phy, ab, "Hellinger")
evodiss(phy, ab, "Chord")

evodiss(phy, ab, "Hill", q=2)
evodiss(phy, ab, "Hill", q=2, w="even")



