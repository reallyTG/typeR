
context("Saving and loading")

test_that("saving and loading works", {
  a <- as_lvec(rnorm(100))
  dir <- tempfile()
  dir.create(dir)

  lsave(a, filename = file.path(dir, "test"))
  expect_true(file.exists(file.path(dir, "test.RDS")))
  expect_true(file.exists(file.path(dir, "test.00001.RDS")))

  b <- lload(file.path(dir, "test"))
  expect_that(as_rvec(b), equals(as_rvec(a)))

  b <- lload(file.path(dir, "test.RDS"))
  expect_that(as_rvec(b), equals(as_rvec(a)))

  lsave(a, filename = file.path(dir, "test.RDS"))
  expect_true(file.exists(file.path(dir, "test.RDS")))
  expect_true(file.exists(file.path(dir, "test.00001.RDS")))
})
