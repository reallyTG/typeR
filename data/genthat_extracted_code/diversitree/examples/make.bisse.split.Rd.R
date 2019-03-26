library(diversitree)


### Name: make.bisse.split
### Title: Binary State Speciation and Extinction Model: Split Models
### Aliases: make.bisse.split make.bisse.uneven
### Keywords: models

### ** Examples

pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
set.seed(546)
phy <- tree.bisse(pars, max.taxa=30, x0=0)

## Here is the phylogeny:
plot(phy, show.node.label=TRUE, label.offset=.1, font=1, cex=.75,
     no.margin=TRUE)

## Here is a plain BiSSE function for comparison:
lik.b <- make.bisse(phy, phy$tip.state)
lik.b(pars) # -93.62479

## Split this phylogeny at three points: nd15, nd18 and nd26
nodes <- c("nd15", "nd18", "nd26")

## This is the index in ape's node indexing:
nodes.i <- match(nodes, phy$node.label) + length(phy$tip.label)

nodelabels(node=nodes.i, pch=19, cex=2, col="#FF000099")

## To make a split BiSSE function, pass the node locations and times in:
lik.s <- make.bisse.split(phy, phy$tip.state, nodes.i)

## The parameters must be a list of the same length as the number of
## partitions.  Partition '1' is the root partition, and partition i is
## the partition rooted at the node[i-1]
pars4 <- rep(pars, 4)
pars4

## Run the likelihod calculation:
lik.s(pars4) # -93.62479

## These are basically identical (to acceptable tolerance)
lik.s(pars4) - lik.b(pars)

## You can use the labelled nodes rather than indices:
lik.s2 <- make.bisse.split(phy, phy$tip.state, nodes)
identical(lik.s(pars4), lik.s2(pars4))

## This also works where some tips are unresolved clades.  Here are a
## few:
unresolved <-
  data.frame(tip.label=c("sp12", "sp32", "sp9", "sp22", "sp11"),
             Nc=c(2,5,3,2,5), n0=c(1, 4, 3, 2, 4), n1=c(1, 1, 0, 0, 1))

## Plain BiSSE with unresolved clades:
lik.u.b <- make.bisse(phy, phy$tip.state, unresolved=unresolved)
lik.u.b(pars) # -139.3688

## Split BiSSE with unresolved clades:
lik.u.s <- make.bisse.split(phy, phy$tip.state, nodes,
                            unresolved=unresolved)
lik.u.s(pars4) # -139.3688

lik.u.b(pars) - lik.u.s(pars4) # numerical error only



