library(nLTT)


### Name: get_norm_brts
### Title: Collect the normalized branching times from the stem age
### Aliases: get_norm_brts

### ** Examples

  phylogeny <- ape::read.tree(text = "((a:2,b:2):1,c:3);")
  phylogeny$root.edge <- 2 # nolint ape variable name
  testthat::expect_true(
    all(nLTT::get_branching_times(phylogeny) == c(5, 3, 2)))



