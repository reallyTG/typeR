library(ips)


### Name: collapseUnsupportedEdges
### Title: Collapse Unsupported Edges
### Aliases: collapseUnsupportedEdges

### ** Examples

## phylogeny of bark beetles
data(ips.tree)

## non-parametric bootstrap proportions (BP)
ips.tree$node.label

## collapse clades with < 70 BP
tr <- collapseUnsupportedEdges(ips.tree, "node.label", 70)

## show new topology
plot(tr, no.margin = TRUE)



