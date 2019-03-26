library(beautier)


### Name: get_crown_age
### Title: Obtain the crown age of a phylogeny.
### Aliases: get_crown_age

### ** Examples

  phylogeny <- ape::read.tree(text = "(a:15,b:15):1;")
  created <- get_crown_age(phylogeny = phylogeny)
  testit::assert(created == 15)



