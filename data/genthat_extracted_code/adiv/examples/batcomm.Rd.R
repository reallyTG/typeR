library(adiv)


### Name: batcomm
### Title: Bat Abundance and Phylogeny Along a Disturbance Gradient in a
###   Neotropical Rainforest
### Aliases: batcomm
### Keywords: datasets

### ** Examples

data(batcomm)
phy <- read.tree(text=batcomm$tre)
plot(phy)
ab <- batcomm$ab[,phy$tip.label]
plot(abgevodivparam(phy, ab, q=0:4))



