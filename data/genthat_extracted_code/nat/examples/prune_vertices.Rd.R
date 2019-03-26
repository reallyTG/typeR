library(nat)


### Name: prune_vertices
### Title: Prune selected vertices or edges from a neuron
### Aliases: prune_vertices prune_edges

### ** Examples

n=prune_vertices(Cell07PNs[[1]], 1:25)
# original neuron
plot(Cell07PNs[[1]])
# with pruned neuron superimposed
plot(n, col='green', lwd=3, add=TRUE)

# use the PointNo field (= the original id from an SWC file)
n2=prune_vertices(n, match(26:30, n$d$PointNo))
y=prune_edges(Cell07PNs[[1]], edges=1:25)

# remove the spine of a neuron
spine_ids=spine(Cell07PNs[[1]], rval='ids')
pruned=prune_edges(Cell07PNs[[1]], spine_ids)

# NB this is subtly different from this, which removes vertices along the
# spine *even* if they are part of an edge that is outside the spine.
pruned2=prune_vertices(Cell07PNs[[1]], spine_ids)



