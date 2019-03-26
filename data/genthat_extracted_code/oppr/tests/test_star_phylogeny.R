context("star_phylogeny")

test_that("valid arguments", {
  # make data
  n <- letters[1:5]
  w <- round(runif(5), 2)
  s <- star_phylogeny(n, w)
  # run tests
  expect_is(s, "phylo")
  expect_identical(s$tip.label, n)
  expect_identical(s$edge.length, w)
  expect_equal(s$edge[, 1], rep(length(n) + 1, length(n)))
  expect_equal(s$edge[, 2], seq_along(n))
})

test_that("invalid arguments", {
  # x argument
  expect_error(star_phylogeny(1:5, runif(5)))
  expect_error(star_phylogeny(rep("a", 5), runif(5)))
  expect_error(star_phylogeny(rep(TRUE, 5), runif(5)))
  # weights argument
  expect_error(star_phylogeny(letters[1:5], -runif(5)))
  expect_error(star_phylogeny(letters[1:5], runif(2)))
  expect_error(star_phylogeny(letters[1:5], letters[1:5]))
  # comparisons of different arguents
  expect_error(star_phylogeny("a", runif(5)))
  expect_error(star_phylogeny(letters[1:5], runif(2)))
})
