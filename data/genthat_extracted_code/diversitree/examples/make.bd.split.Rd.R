library(diversitree)


### Name: make.bd.split
### Title: Constant Rate Birth-Death Models: Split Models
### Aliases: make.bd.split
### Keywords: models

### ** Examples

set.seed(1)
pars <- c(.1, .03)
phy <- trees(pars, "bd", max.taxa=30)[[1]]

## Here is the phylogeny:
plot(phy, show.node.label=TRUE, label.offset=.1, font=1, cex=.75,
     no.margin=TRUE)

## Construct the plain likelihood function as a benchmark:
lik <- make.bd(phy)
lik(pars) # -21.74554

## Split this phylogeny at three points: nd11, nd13 and nd26
nodes <- c("nd11", "nd13", "nd26")

## This is the index in ape's node indexing:
nodes.i <- match(nodes, phy$node.label) + length(phy$tip.label)

nodelabels(node=nodes.i, pch=19, cex=2, col="#FF000099")

## To make a split likelihood function, pass the node locations and times in:
lik.s <- make.bd.split(phy, nodes)

## The parameters must be a list of the same length as the number of
## partitions.  Partition '1' is the root partition, and partition i is
## the partition rooted at the node[i-1]
pars4 <- rep(pars, 4)
names(pars4) <- argnames(lik.s)

## Run the likelihod calculation:
lik.s(pars4) # -21.74554

## These are basically identical (to acceptable tolerance)
lik.s(pars4) - lik(pars)

## You can use the labelled nodes rather than indices:
lik.s2 <- make.bd.split(phy, nodes)
identical(lik.s(pars4), lik.s2(pars4))

## All the usual ML/MCMC functions work as before:
fit <- find.mle(lik.s, pars4)



