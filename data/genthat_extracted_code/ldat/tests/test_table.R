
context("table")

options(chunk_size = 1E3)

example_size <- 3E3

test_that("table works with lvecs", {
  x <- generate(example_size, sample, x = 10, replace = TRUE)
  y <- generate(example_size, sample, x = 3, replace = TRUE)
  t <- table.lvec(Var1 = x, Var2 = y, useNA = "no")
  t_r <- table(Var1 = as_rvec(x), Var2 = as_rvec(y))
  expect_that(t, equals(t_r))
  
  # With useNA = "always
  t <- table.lvec(Var1 = x, Var2 = y, useNA = "always")
  t_r <- table(Var1 = as_rvec(x), Var2 = as_rvec(y), useNA = "always")
  expect_that(t, equals(t_r))
  
  # With missing values
  x <- generate(example_size, sample, x = c(10, NA), replace = TRUE)
  t <- table.lvec(Var1 = x, Var2 = y, useNA="no")
  t_r <- table(Var1 = as_rvec(x), Var2 = as_rvec(y))
  expect_that(t, equals(t_r))

  # With missing values
  x <- generate(example_size, sample, x = c(10, NA), replace = TRUE)
  t <- table.lvec(Var1 = x, Var2 = y)
  t_r <- table(Var1 = as_rvec(x), Var2 = as_rvec(y), useNA = "ifany")
  expect_that(t, equals(t_r))
})


test_that("table works with ldat objects", {
  x <- ldat(x = generate(example_size, sample, x = 10, replace = TRUE),
    y  = generate(example_size, sample, x = 3, replace = TRUE))
  t <- table(x, useNA = "no")
  t_r <- table(as.data.frame(x))
  expect_that(t, equals(t_r))
  
  # With useNA = "always
  t <- table(x, useNA = "always")
  t_r <- table(as.data.frame(x), useNA = "always")
  expect_that(t, equals(t_r))
  
  # With missing values
  x$x <- generate(example_size, sample, x = c(10, NA), replace = TRUE)
  t <- table(x, useNA="no")
  t_r <- table(as.data.frame(x))
  expect_that(t, equals(t_r))

  # With missing values
  t <- table(x)
  t_r <- table(as.data.frame(x), useNA = "ifany")
  expect_that(t, equals(t_r))
})
