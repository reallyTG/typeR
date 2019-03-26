library(ape)


### Name: root
### Title: Roots Phylogenetic Trees
### Aliases: root root.phylo root.multiPhylo unroot unroot.phylo
###   unroot.multiPhylo is.rooted is.rooted.phylo is.rooted.multiPhylo
### Keywords: manip

### ** Examples

data(bird.orders)
plot(root(bird.orders, 1))
plot(root(bird.orders, 1:5))

tr <- root(bird.orders, 1)
is.rooted(bird.orders) # yes
is.rooted(tr)          # no
### This is because the tree has been unrooted first before rerooting.
### You can delete the outgroup...
is.rooted(drop.tip(tr, "Struthioniformes"))
### ... or resolve the basal trichotomy in two ways:
is.rooted(multi2di(tr))
is.rooted(root(bird.orders, 1, r = TRUE))
### To keep the basal trichotomy but forcing the tree as rooted:
tr$root.edge <- 0
is.rooted(tr)

x <- setNames(rmtree(10, 10), LETTERS[1:10])
is.rooted(x)



