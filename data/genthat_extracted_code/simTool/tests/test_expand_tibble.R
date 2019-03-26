testthat::context("test_expand_tibble.R")

tmp <- expand_tibble(
  desc = letters[1:2],
  mod = list(
    lm(Sepal.Length ~ Sepal.Width, data = iris),
    lm(Sepal.Length ~ Petal.Width, data = iris)
  )
)

er <- dplyr::tibble(
  desc = c("a", "b", "a", "b"),
  mod = list(
    lm(Sepal.Length ~ Sepal.Width, data = iris),
    lm(Sepal.Length ~ Sepal.Width, data = iris),
    lm(Sepal.Length ~ Petal.Width, data = iris),
    lm(Sepal.Length ~ Petal.Width, data = iris)
  )
)

test_that("Combinations work also with things like model fits", {
  expect_equal(tmp$desc, er$desc)
  expect_equal(tmp$mod, er$mod)
})
#-----------------------------------------------------------------
