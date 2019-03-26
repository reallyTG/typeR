context("test-set_version.R")

test_that("canSetSvptr", {
  semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
  res <- as.character(set_version(semver[[1]], "major", 2L))
  expect_identical(res, "2.2.3")
  res <- as.character(set_version(semver[[1]], "minor", 3L))
  expect_identical(res, "1.3.3")
  res <- as.character(set_version(semver[[1]], "patch", 4L))
  expect_identical(res, "1.2.4")
  res <- as.character(set_version(semver[[1]], "prerelease", "alpha"))
  expect_identical(res, "1.2.3-alpha")
  res <- as.character(set_version(semver[[2]], "build", "bld1.1"))
  expect_identical(res, "1.2.4-alpha+bld1.1")
})

test_that("errorWhenSetSvptr", {
  semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
  expect_error(
    set_version(semver[[1]], "major", "2L"),
    "value should be an integer"
  )
  expect_error(
    set_version(semver[[1]], "build", 2L),
    "value should be a character string"
  )
})

test_that("canDollarAssignSvptr", {
  semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
  semver[[1]]$major <- 3L
  expect_identical(as.character(semver[[1]]), "3.2.3")
})

test_that("canSetSvlist", {
  semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
  res <- as.character(set_version(semver, "major", list(2L)))
  expect_identical(res, c("2.2.3", "2.2.4-alpha+bld1"))
  res <- as.character(set_version(semver, c("major", "minor"), list(3L)))
  expect_identical(res, c("3.2.3", "1.3.4-alpha+bld1"))
  res <- as.character(set_version(semver, c("minor"), list(3L, 3L)))
  expect_identical(res, c("1.3.3", "1.3.4-alpha+bld1"))
  res <- as.character(set_version(semver,
                                  c("prerelease", "build"),
                                  list("hello", "world")))
  expect_identical(res, c("1.2.3-hello", "1.2.4-alpha+world"))
})

test_that("errorWhenResetSvptr", {
  semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
  expect_error(
    set_version(semver, "major", 2L),
    "value is not a list"
  )
})
