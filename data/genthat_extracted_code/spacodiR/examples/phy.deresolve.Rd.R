library(spacodiR)


### Name: phy.deresolve
### Title: collapse phylogenetic nodes into multichotomies
### Aliases: phy.deresolve

### ** Examples

data(sp.example)
attach(sp.example)

## An example with an internal temporal bin
# arbitrarily transform tree to a root age of 100
phy$edge.length=phy$edge.length*(100/max(branching.times(phy)))

# collapse nodes within the middle half of the tree's history
mulphy=phy.deresolve(phy=phy, time.range=c(0.05, 0.95))

# compare result with original tree
plot(mulphy, show.tip.label=FALSE)
mtext("multifurcations in the middle nine-tenths")
dev.new()
plot(phy, show.tip.label=FALSE)
mtext("original phylogeny")

## An example with time.range given by a single value
mulphy=phy.deresolve(phy=phy, time.range=0.25) # affects the most recent quarter of the tree
dev.new()
plot(mulphy, show.tip.label=FALSE)
mtext("multifurcations in the most recent quarter")

## An example showing effect of 'relative'
phy$edge.length=phy$edge.length*(100/max(branching.times(phy)))
dev.new()
plot(dd<-phy.deresolve(phy=phy, time.range=c(0,1), relative=FALSE))
mtext("relative = FALSE")
dev.new()
plot(rr<-phy.deresolve(phy=phy, time.range=c(0,1), relative=TRUE))
mtext("relative = TRUE")






