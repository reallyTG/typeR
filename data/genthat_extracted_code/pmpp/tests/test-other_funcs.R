context("Other functions")

set.seed(1)

test_that("pmpp_data function works", {
  matrix_var <- matrix(rnorm(100), nrow = 20)
  panel_var <- pmpp_data(matrix_var)

  expect_equal(nrow(panel_var), 100)
  expect_true(all(as.numeric(unique(panel_var$unit)) %in% 1:20))
  expect_true(all(as.numeric(unique(panel_var$time)) %in% 1:5))
})

test_that("create_fframe function works", {
  data(EmplUK, package = "plm")
  EmplUK <- dplyr::filter(EmplUK, year %in% c(1978, 1979, 1980, 1981, 1982))
  fframe <- create_fframe(EmplUK, 1983)

  expect_equal(nrow(fframe), 840)
  expect_true(all(is.na(
    filter(fframe, year == 1983) %>%
      select(-year, -firm)
  )))
})

test_that("kde function works", {
  data <- c(rnorm(10 ^ 3), rnorm(10 ^ 3) * 2 + 30)
  d <- kde(data)

  expect_true("matrix" %in% class(d))
  expect_equal(nrow(d), 2)
  expect_equal(ncol(d), 16384)
})

test_that("kde2d function works", {
  data <- as.matrix(data.frame(rnorm(500, 0, 1), rnorm(500, 15, 2)))
  d2d <- suppressWarnings(kde2D(data))

  expect_true("list" %in% class(d2d))
  expect_true(all(names(d2d) %in% c("bandwidth", "density", "X", "Y")))
})
