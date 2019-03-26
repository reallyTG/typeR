context("test-increment_version")

test_that("canIncrementSvptr", {
  semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
  res <- as.character(increment_version(semver[[1]], "major", 2L))
  expect_identical(res, "3.0.0")
  res <- as.character(increment_version(semver[[1]], "minor", 1L))
  expect_identical(res, "1.3.0")
  res <- as.character(increment_version(semver[[2]], "patch", 3L))
  expect_identical(res, "1.2.7")
})

test_that("canDecrementSvptr", {
  semver <- parse_version(c("2.2.3", "1.2.4-alpha+bld1"))
  res <- as.character(increment_version(semver[[1]], "major", -1L))
  expect_identical(res, "1.0.0")
  res <- as.character(increment_version(semver[[1]], "minor", -1L))
  expect_identical(res, "2.1.0")
  res <- as.character(increment_version(semver[[2]], "patch", -3L))
  expect_identical(res, "1.2.1")
})

test_that("errorWhenIncrementSvptr", {
  semver <- parse_version(c("2.2.3", "1.2.4-alpha+bld1"))
  expect_error(
    increment_version(semver[[1]], "major", "-1L"),
    "value should be an integer"
  )
})

test_that("canIncrementSvlist", {
  semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
  res <- as.character(increment_version(semver, "major", c(2L)))
  expect_identical(res, c("3.0.0", "3.0.0"))
  res <- as.character(increment_version(semver, c("major", "minor"), c(3L)))
  expect_identical(res, c("4.0.0", "1.5.0"))
  res <- as.character(increment_version(semver, c("minor"), c(3L, 3L)))
  expect_identical(res, c("1.5.0", "1.5.0"))
  res <- as.character(increment_version(semver, c("minor", "patch"),
                                        c(-1L, -3L)))
  expect_identical(res, c("1.1.0", "1.2.1"))
})

test_that("errorWhenIncrementSvptr", {
  semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
  expect_error(
    increment_version(semver, "major", "2L"),
    "value should be an integer"
  )
})
