library(nLTT)


### Name: get_n_lineages
### Title: Collect the number of lineages from the stem age
### Aliases: get_n_lineages

### ** Examples

  phylogeny <- ape::read.tree(text = "((a:2,b:2):1,c:3);")
  testthat::expect_true(
    all(nLTT::get_n_lineages(phylogeny) == c(2, 3)))
  phylogeny$root.edge <- 2 # nolint ape variable name
  testthat::expect_true(
    all(nLTT::get_n_lineages(phylogeny) == c(1, 2, 3)))



