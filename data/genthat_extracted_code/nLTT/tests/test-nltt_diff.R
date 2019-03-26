context("nltt_diff")


test_that("nltt_diff must signal it cannot handle polytomies, #23", {
  phylogeny_1 <- ape::read.tree(text = "(a:1,b:1):1;")
  phylogeny_2 <- ape::read.tree(
    text = "((d:0.0000001,c:0.0000001):1,b:1,a:1):1;")
  phylogeny_3 <- ape::read.tree(
    text = "(((d:0.000000001,c:0.000000001):1,b:1):0.000000001,a:1.000000001):1;") # nolint

  expect_equal(nLTT::nltt_diff(phylogeny_1, phylogeny_1), 0.00,
    tolerance = 0.0001)
  expect_equal(nLTT::nltt_diff(phylogeny_1, phylogeny_3), 0.25,
    tolerance = 0.0001)
  expect_equal(nLTT::nltt_diff(phylogeny_3, phylogeny_3), 0.00,
    tolerance = 0.0001)

  expect_error(nLTT::nltt_diff(phylogeny_1, phylogeny_2),
    "phylogenies must both be binary")
})
