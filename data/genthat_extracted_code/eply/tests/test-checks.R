context("checks")

test_that("checks_eply works.", {
  f <- example.fun
  e <- example.expr()
  w <- example.with()
  expect_error(eply())
  expect_error(eply(.fun = "bla", .expr = e, .with = w))
  expect_error(eply(.fun = f, .expr = NULL, .with = w))
  d3array <- array(1:27, dim = rep(3, 3))
  expect_error(eply(.fun = f, .expr = d3array, .with = w))
  expect_error(eply(.fun = f, .expr = 1, .with = w))
  expect_error(eply(
    .fun = f,
    .expr = data.frame(x = NULL, y = NULL),
    .with = w
  ))
  expect_error(eply(.fun = f, .expr = e[, -1], .with = w))
  expect_error(eply(.fun = f, .expr = e, .with = NULL))
  expect_error(eply(.fun = f, .expr = e, .with = c(a = 1, b = 2)))
  expect_error(eply(.fun = f, .expr = e, .with = w, .split = "bla"))
  expect_error(eply(.fun = f, .expr = e, .with = w, .tasks = NULL))
  expect_error(eply(.fun = f, .expr = e, .with = w, .tasks = "bla"))
  expect_error(eply(.fun = f, .expr = e, .with = w, .tasks = 1:5))
  expect_error(eply(.fun = f, .expr = e, .with = w, .tasks = 0))
  expect_silent(o <- eply(.fun = f, .expr = e, .with = w))
})

test_that("checks_evals works.", {
  expect_equal(evals(), NULL)
  x <- c("1+1", "2+2")
  expect_silent(o <- evals(x))
  expect_silent(o <- evals(x, .with = list(), .simplify = T))
  expect_error(evals(x, .with = NULL))
  expect_error(evals(x, .with = "bla"))
  expect_error(evals(x, .simplify = NULL))
  expect_error(evals(x, .simplify = "bla"))
  expect_error(evals(x, .simplify = c(T, F)))
})
