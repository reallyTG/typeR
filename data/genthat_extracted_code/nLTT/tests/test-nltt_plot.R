context("nltt_plot")

test_that("use", {

  testthat::expect_silent(nltt_plot(ape::rcoal(10)))
  testthat::expect_silent(nltt_lines(ape::rcoal(10)))
})

test_that("abuse", {
  testthat::expect_error(
    nltt_plot("not a phylogeny"),
    "phylogeny must be of class 'phylo'"
  )
  testthat::expect_error(
    nltt_lines("not a phylogeny"),
    "phylogeny must be of class 'phylo'"
  )

})
