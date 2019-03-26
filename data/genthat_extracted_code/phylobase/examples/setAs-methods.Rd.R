library(phylobase)


### Name: setAs
### Title: Converting between phylo4/phylo4d and other phylogenetic tree
###   formats
### Aliases: setAs as as-method as,phylo,phylo4-method setAs
###   as,phylo,phylo4d-method setAs as,nexml,phylo4-method setAs
###   as,nexml,phylo4d-method setAs as,phylo4,phylo-method setAs
###   setAs,phylo4,phylog-method setAs setAs,phylo4,data.frame-method
### Keywords: methods

### ** Examples

tree_string <- "(((Strix_aluco:4.2,Asio_otus:4.2):3.1,Athene_noctua:7.3):6.3,Tyto_alba:13.5);"
tree.owls <- ape::read.tree(text=tree_string)
## round trip conversion
tree_in_phylo <- tree.owls                  # tree is a phylo object
(tree_in_phylo4 <- as(tree.owls,"phylo4"))  # phylo converted to phylo4
identical(tree_in_phylo,as(tree_in_phylo4,"phylo"))
## test if phylo, and phylo4 converted to phylo are identical
## (no, because of dimnames)

## Conversion to phylog (ade4)
as(tree_in_phylo4, "phylog")

## Conversion to data.frame
as(tree_in_phylo4, "data.frame")

## Conversion to phylo (ape)
as(tree_in_phylo4, "phylo")

## Conversion to phylo4d, (data slots empty)
as(tree_in_phylo4, "phylo4d")



