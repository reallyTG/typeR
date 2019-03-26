context("nltt_diff_exact")

test_that("nltt_diff_exact simple use", {

  tree1 <- ape::read.tree(text = "(a:1,b:1):1;")

  # The tree must not have a trifurcation
  tree2 <- ape::read.tree(
    text = "(((d:0.000000001,c:0.000000001):1,b:1):0.000000001,a:1.000000001):1;") # nolint
  testit::assert(ape::is.binary(tree2))
  testthat::expect_equal(
    nLTT::nltt_diff(tree1 = tree1, tree2 = tree2),
    0.25, tolerance = 0.0001
  )

  testthat::expect_equal(
    nLTT::nltt_diff_exact(
      tree1 = tree1, tree2 = tree2, ignore_stem = FALSE),
    0.25, tolerance = 0.0001
  )

})

test_that("nltt_diff_exact does not work on trees with negative branch lengths", { # nolint

  # The tree must not have a trifurcation
  # tree1 is correct, tree2 is incorrect
  tree1 <- ape::read.tree(
    text = "(((d:0.000000001,c:0.000000001):1,b:1):0.000000001,a:1.000000001):1;") # nolint
  tree2 <- ape::read.tree(
    text = "(((d:0.000000001,c:0.000000001):1,b:1):0.000000001,a:1.0):1;") # nolint
  testit::assert(ape::is.binary(tree1))
  testit::assert(ape::is.binary(tree2))

  testthat::expect_equal(
    nLTT::nltt_diff_exact(tree1 = tree1, tree2 = tree1),
    0.0, tolerance = 0.0001)

  testthat::expect_error(
    nLTT::nltt_diff_exact(tree1 = tree2, tree2 = tree2),
    "tree1 cannot have negative branching times"
    )

  testthat::expect_error(
    nLTT::nltt_diff_exact(tree1 = tree1, tree2 = tree2),
    "tree2 cannot have negative branching times"
    )

})
