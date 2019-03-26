context("nltts_plot")

test_that("use", {

  set.seed(42)
  n_tips <- 10
  phylos <- c(ape::rcoal(n = n_tips))
  testthat::expect_silent(nltts_plot(phylos))
})

test_that("abuse", {

  testthat::expect_error(
    nltts_plot(NULL),
    "there must be at least one phylogeny supplied"
  )
  testthat::expect_error(
    nltts_plot("nonsense"),
    "phylogenies must be of class 'multiPhylo' or 'list'"
  )

})
