library(paleotree)


### Name: treeContradiction
### Title: Measure the Contradiction Difference Between Two Phylogenetic
###   Topologies
### Aliases: treeContradiction

### ** Examples


# let's simulate two trees

set.seed(1)
treeA <- rtree(30,br = NULL)
treeB <- rtree(30,br = NULL)

## Not run: 
##D 
##D # visualize the difference between these two trees
##D library(phytools)
##D plot(cophylo(treeA,treeB))
##D 
##D # what is the Robinson-Foulds (RF) distance between these trees?
##D library(phangorn)
##D treedist(treeA,treeB)
##D 
## End(Not run)

# The RF distance is less intuitive when 
    # we consider a tree that isn't well-resolved

# let's simulate the worst resolved tree possible: a star tree
treeC <- stree(30)

## Not run: 
##D # plot the tanglegram between A and C
##D plot(cophylo(treeA,treeC))
##D 
##D # however the RF distance is *not* zero
##D # even though the only difference is a difference in resolution
##D treedist(treeA,treeC)
## End(Not run)

# the contradiction difference (CD) ignores differences in resolution

# Tree C (the star tree) has zero CD between it and trees A and B
identical(treeContradiction(treeA,treeC),0)  # should be zero distance
identical(treeContradiction(treeB,treeC),0)  # should be zero distance

# two identical trees also have zero CD between them (as you'd hope) 
identical(treeContradiction(treeA,treeA),0)  # should be zero distance

#' and here's the CD between A and B
treeContradiction(treeA,treeB)  # should be non-zero distance

# a less ideal property of the CD is that two taxon on opposite ends of the 
# moving from side of the topology to the other of an otherwise identical tree
# will return the maximum contradiction difference possible (i.e., ` =  1`)

# an example
treeAA <- read.tree(text = "(A,(B,(C,(D,(E,F)))));")
treeBB <- read.tree(text = "(E,(B,(C,(D,(A,F)))));")

## Not run: 
##D plot(cophylo(treeAA,treeBB))
## End(Not run)

treeContradiction(treeAA,treeBB)

## Not run: 
##D # Note however also a property of RF distance too:
##D treedist(treeAA,treeBB)
## End(Not run)




