context("nLTTstat_exact")

test_that("nLTTstat_exact use", {

  set.seed(42)
  p <- ape::rcoal(10)
  q <- ape::rcoal(10)

  expect_equal(
    0.0, nLTTstat_exact(tree1 = p, tree2 = p, distance_method = "abs"), # nolint nLTTstat_exact should be all lowercase, left in for backwards compatibility
    tolerance = 0.0001
  )
  expect_equal(
    0.0, nLTTstat_exact(tree1 = p, tree2 = p, distance_method = "squ"), # nolint nLTTstat_exact should be all lowercase, left in for backwards compatibility
    tolerance = 0.0001
  )

  expect_equal(
    0.1108467, nLTTstat_exact(tree1 = p, tree2 = q, distance_method = "abs"), # nolint nLTTstat_exact should be all lowercase, left in for backwards compatibility
    tolerance = 0.0001
  )

  expect_equal(
    nLTTstat_exact(tree1 = p, tree2 = q, distance_method = "abs"), # nolint nLTTstat_exact should be all lowercase, left in for backwards compatibility
    nLTTstat_exact(tree1 = p, tree2 = q, distance_method = "abs"),  # nolint nLTTstat_exact should be all lowercase, left in for backwards compatibility
    tolerance = 0.0001
  )

  expect_equal(
    0.0, nLTTstat_exact(tree1 = q, tree2 = q, distance_method = "abs"), # nolint nLTTstat_exact should be all lowercase, left in for backwards compatibility
    tolerance = 0.0001
  )
  expect_equal(
    0.0, nLTTstat_exact(tree1 = q, tree2 = q, distance_method = "squ"), # nolint nLTTstat_exact should be all lowercase, left in for backwards compatibility
    tolerance = 0.0001
  )

})


test_that("nLTTstat_exact abuse", {

  phylo <- ape::rcoal(10)

  expect_error(
    nLTTstat_exact(tree1 = 42, tree2 = phylo, distance_method = "abs"), # nolint nLTTstat_exact should be all lowercase, left in for backwards compatibility
    "nLTTstat_exact: tree1 must be of class 'phylo'"
  )
  expect_error(
    nLTTstat_exact(tree1 = phylo, tree2 = 42, distance_method = "abs"), # nolint nLTTstat_exact should be all lowercase, left in for backwards compatibility
    "nLTTstat_exact: tree2 must be of class 'phylo'"
  )
  expect_error(
    nLTTstat_exact(tree1 = phylo, tree2 = phylo, distance_method = "nonsense"), # nolint nLTTstat_exact should be all lowercase, left in for backwards compatibility
    "nLTTstat_exact: distance method unknown"
  )

  expect_error(
    nLTTstat_exact(tree1 = phylo, tree2 = phylo, ignore_stem = "no logical"), # nolint nLTTstat_exact should be all lowercase, left in for backwards compatibility
    "nLTTstat_exact: ignore_stem must be logical"
  )
})

test_that("nLTTstat_exact may ignore the stem", {

  # Create a stemless phylogeny with two branches of length 1.0
  tree1 <- ape::rcoal(2)
  tree1$edge.length <- tree1$edge.length / tree1$edge.length[1] # nolint ape variable name
  # Create a phylogeny with two branches of length 1.0 and a stem length of 1
  tree2 <- tree1
  tree2$root.edge <- 1 # nolint ape variable name

  # Without taking the stem into account, the nLTT statistic between
  # identical  trees is zero
  expect_equal(0.0, nLTT::nLTTstat_exact(tree1, tree1, ignore_stem = TRUE))
  expect_equal(0.0, nLTT::nLTTstat_exact(tree2, tree2, ignore_stem = TRUE))

  # Without the stem, there is no nLTT difference between the two phylogenies
  expect_equal(0.00, nLTT::nLTTstat_exact(tree1, tree2, ignore_stem = TRUE))
  expect_equal(0.00, nLTT::nLTTstat_exact(tree2, tree1, ignore_stem = TRUE))

  # With taking the stem into account, the nLTT statistic between
  # identical  trees is zero
  expect_equal(0.0, nLTT::nLTTstat_exact(tree1, tree1, ignore_stem = FALSE))
  expect_equal(0.0, nLTT::nLTTstat_exact(tree2, tree2, ignore_stem = FALSE))

  # With taking the stem into account, the nLTT statistic between
  # different trees is about one quarter
  expect_equal(0.25, nLTT::nLTTstat_exact(tree1, tree2, ignore_stem = FALSE))
  expect_equal(0.25, nLTT::nLTTstat_exact(tree2, tree1, ignore_stem = FALSE))
})

test_that("nLTTstat_exact on two rcoal trees, do ignore stem", {

   set.seed(42)
  p <- ape::rcoal(5)
  p$root.edge <- 0.1 # nolint ape variable name
  q <- ape::rcoal(5)
  p$root.edge <- 0.2 # nolint ape variable name
  testthat::expect_silent(nLTT::nLTTstat_exact(p, q, ignore_stem = TRUE))
})

test_that("nLTTstat_exact on two rcoal trees, do not ignore stem", {

  set.seed(42)
  p <- ape::rcoal(5)
  p$root.edge <- 0.1 # nolint ape variable name
  q <- ape::rcoal(5)
  p$root.edge <- 0.2 # nolint ape variable name
  testthat::expect_silent(nLTT::nLTTstat_exact(p, q, ignore_stem = FALSE))
})

test_that("adding a stem causes branch lengths to become NAs", {

  set.seed(42)
  p <- ape::rcoal(5)
  testthat::expect_true(!any(is.na(ape::branching.times(p))))
  p$root.edge <- 0.1 # nolint ape variable name
  testthat::expect_true(!any(is.na(ape::branching.times(p))))
})
