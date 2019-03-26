library(phylobase)


### Name: hasSingle
### Title: Test trees for polytomies, inline nodes (singletons), or
###   reticulation
### Aliases: hasSingle hasSingle,phylo4-method hasRetic
###   hasRetic,phylo4-method hasPoly hasPoly,phylo4-method
### Keywords: misc

### ** Examples


tree.owls.bis <- ape::read.tree(text="((Strix_aluco:4.2,Asio_otus:4.2):3.1,Athene_noctua:7.3);")
owls4 <- as(tree.owls.bis, "phylo4")
hasPoly(owls4)
hasSingle(owls4)




