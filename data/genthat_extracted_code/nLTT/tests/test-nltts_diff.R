context("nltts_diff")

test_that("use", {

  tree <- ape::rcoal(5)
  trees <- c(ape::rcoal(5), ape::rcoal(5))
  created <- nltts_diff(
    tree = tree,
    trees = trees,
    distance_method = "abs",
    ignore_stem = TRUE
  )
  expected <- c(nltt_diff(tree, trees[[1]]), nltt_diff(tree, trees[[2]]))
  testthat::expect_equal(created, expected)
})

test_that("abuse", {

  testthat::expect_error(
    nltts_diff(
      tree = "nonsense",
      trees = c(ape::rcoal(5), ape::rcoal(5))
    ),
    "'tree' must be of type 'phylo'"
  )

  testthat::expect_error(
    nltts_diff(
      tree = ape::rcoal(5),
      trees = "nonsense"
    ),
    "'trees' must be of type 'multiPhylo'"
  )

  testthat::expect_error(
    nltts_diff(
      tree = ape::rcoal(5),
      trees = c(ape::rcoal(5), ape::rcoal(5)),
      distance_method = "nonsense"
    ),
    "'distance_method' must be either 'abs' or 'squ'"
  )

  testthat::expect_error(
    nltts_diff(
      tree = ape::rcoal(5),
      trees = c(ape::rcoal(5), ape::rcoal(5)),
      ignore_stem = "nonsense"
    ),
    "'ignore_stem' must be either TRUE or FALSE"
  )

})
