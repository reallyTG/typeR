library(beautier)


### Name: is_phylo
### Title: Checks if the input is a phylogeny
### Aliases: is_phylo

### ** Examples

  phylogeny <- ape::read.tree(text = "(a:15,b:15):1;")
  testit::assert(is_phylo(phylogeny))

  testit::assert(!is_phylo("nonsense"))
  testit::assert(!is_phylo(NA))
  testit::assert(!is_phylo(NULL))



