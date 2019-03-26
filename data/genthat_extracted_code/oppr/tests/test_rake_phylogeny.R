context("rake_phylogeny")

test_that("valid arguments", {
  # make data
  n <- letters[1:5]
  w <- round(runif(5), 2)
  b <- 100
  r <- rake_phylogeny(n, w, b)
  # run tests
  expect_is(r, "phylo")
  expect_identical(r$tip.label, n)
  expect_identical(r$edge.length, c(w, b))
  expect_equal(r$edge[, 1][-6], rep(length(n) + 1, length(n)))
  expect_equal(r$edge[, 2][-6], seq_along(n))
  expect_equal(r$edge[6, 1], 7)
  expect_equal(r$edge[6, 2], 6)
})

test_that("invalid arguments", {
  # x argument
  expect_error(rake_phylogeny(1:5))
  expect_error(rake_phylogeny(rep("a", 5)))
  expect_error(rake_phylogeny(rep(TRUE, 5)))
  # species_weights argument
  expect_error(rake_phylogeny(letters[1:5], -runif(5)))
  expect_error(rake_phylogeny(letters[1:5], runif(2)))
  expect_error(rake_phylogeny(letters[1:5], letters[1:5]))
  # branch_weight argument
  expect_error(rake_phylogeny(letters[1:5], runif(5), NA_real_))
  expect_error(rake_phylogeny(letters[1:5], runif(5), FALSE))
  expect_error(rake_phylogeny(letters[1:5], runif(5), letters[1:5]))
  # comparisons of different arguments
  expect_error(rake_phylogeny("a", runif(5)))
  expect_error(rake_phylogeny(letters[1:5], runif(2)))
})
