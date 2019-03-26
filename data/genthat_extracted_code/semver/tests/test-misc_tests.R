context("test-misc")

test_that("canCallIs_character", {
  test1 <- is_character(2.2)
  test2 <- is_character("2.2")
  test3 <- is_character(2L)
  test4 <- is_character(letters[1:4])
  expect_false(test1)
  expect_true(test2)
  expect_false(test3)
  expect_true(test4)
})

test_that("canDollarTabComplete", {
  version <- c("1.2.3-test","1.2.3-321", "1.2.3-test.1", "1.2.3-1.test",
               "1.2.3-test.123456", "1.2.3-123456.test",
               "1.2.3-1.a.22.bb.333.ccc.4444.dddd.55555.fffff",
               "1.2.3-alpha.1.2.3+build.314")
  out <- parse_version(version)
  res <- semver:::.DollarNames.svptr(out[[8]], "bui")
  expect_identical(res, "build")
})
