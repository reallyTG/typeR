library(spacodiR)


### Name: resamp.phy
### Title: partial phylogeny randomization for tips
### Aliases: resamp.phy

### ** Examples

# load a tree
data(sp.example)
attach(sp.example)
plot(phy)
mtext("original phylogeny")

# reshuffle within a time range
time=1/3
bb=branching.times(phy)
bb=bb/max(bb)
nodes=(Ntip(phy)+1):max(phy$edge)
nodes[bb<=time]=1

dev.new()
plot(resamp.phy(phy, time.threshold=time, proportion=TRUE))
mtext("reshuffled phylogeny showing affected nodes")
nodelabels(cex=ifelse(nodes==1, 2, NA), col=ifelse(nodes==1, 1, NA), pch=19)




