library(rdiversity)


### Name: repartition
### Title: Repartition metacommunity
### Aliases: repartition

### ** Examples

tree <- ape::rtree(n = 5)
tree$tip.label <- paste0("sp", seq_along(tree$tip.label))
partition <- cbind(a = sample(5,5), b = sample(5,5))
row.names(partition) <- tree$tip.label
partition <- partition / sum(partition)
meta <- metacommunity(partition, tree)
meta@raw_abundance

a <- repartition(meta)
a@raw_abundance

# Non-phylogenetic example
meta <- metacommunity(partition)
meta@type_abundance
a <- repartition(meta)
a@type_abundance




