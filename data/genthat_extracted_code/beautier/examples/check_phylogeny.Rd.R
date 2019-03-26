library(beautier)


### Name: check_phylogeny
### Title: Check if the phylogeny is a valid phylogeny object.
### Aliases: check_phylogeny

### ** Examples

 phylogeny <- ape::read.tree(text = "(A:1, B:1):1;")
 testthat::expect_silent(check_phylogeny(phylogeny))

 # Must stop on non-phylogenies
 testthat::expect_error(check_phylogeny(phylo = "nonsense"))
 testthat::expect_error(check_phylogeny(phylo = NULL))
 testthat::expect_error(check_phylogeny(phylo = NA))



