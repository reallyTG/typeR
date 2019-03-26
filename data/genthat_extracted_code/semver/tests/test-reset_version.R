context("test-reset_version")

test_that("canResetSvptr", {
  semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
  res <- as.character(reset_version(semver[[1]], "major", 2L))
  expect_identical(res, "2.0.0")
  res <- as.character(reset_version(semver[[1]], "minor", 1L))
  expect_identical(res, "1.1.0")
  res <- as.character(reset_version(semver[[2]], "patch", 3L))
  expect_identical(res, "1.2.3")
  res <- as.character(reset_version(semver[[2]], "prerelease", "beta"))
  expect_identical(res, "1.2.4-beta")
  res <- as.character(reset_version(semver[[2]], "build", "bld1.1"))
  expect_identical(res, "1.2.4-alpha+bld1.1")
})

test_that("errorWhenResetSvptr", {
  semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
  expect_error(
    reset_version(semver[[1]], "major", "2L"),
    "value should be an integer"
  )
  expect_error(
    reset_version(semver[[1]], "build", 2L),
    "value should be a character string"
  )
})

test_that("canResetSvlist", {
  semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
  res <- as.character(reset_version(semver, "major", list(2L)))
  expect_identical(res, c("2.0.0", "2.0.0"))
  res <- as.character(reset_version(semver, c("major", "minor"), list(3L)))
  expect_identical(res, c("3.0.0", "1.3.0"))
  res <- as.character(reset_version(semver, c("minor"), list(3L, 3L)))
  expect_identical(res, c("1.3.0", "1.3.0"))
  res <- as.character(reset_version(semver,
                                  c("prerelease", "build"),
                                  list("hello", "world")))
  expect_identical(res, c("1.2.3-hello", "1.2.4-alpha+world"))
})

test_that("errorWhenResetSvptr", {
  semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
  expect_error(
    reset_version(semver, "major", 2L),
    "value is not a list"
  )
})
