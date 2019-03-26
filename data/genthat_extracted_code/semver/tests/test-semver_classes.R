context("test-semver_classes")

test_that("canPrintSvptr", {
  version <- c("1.2.3-test","1.2.3-321", "1.2.3-test.1", "1.2.3-1.test",
               "1.2.3-test.123456", "1.2.3-123456.test",
               "1.2.3-1.a.22.bb.333.ccc.4444.dddd.55555.fffff",
               "1.2.3-alpha.1.2.3+build.314")
  out <- parse_version(version)
  expect_output(print(out[[8]]),
                "Maj: 1 Min: 2 Pat: 3 Pre: alpha.1.2.3 Bld: build.314")
})

test_that("canPrintSvlist", {
  version <- c("1.2.3-test","1.2.3-321", "1.2.3-test.1", "1.2.3-1.test",
               "1.2.3-test.123456", "1.2.3-123456.test",
               "1.2.3-1.a.22.bb.333.ccc.4444.dddd.55555.fffff",
               "1.2.3-alpha.1.2.3+build.314")
  out <- parse_version(version)
  expect_output(print(out), "\\[5\\] Maj: 1 Min: 2 Pat: 3 Pre: test.123456")
})

test_that("canExtractFromSvlist", {
  version <- c("1.2.3-test","1.2.3-321", "1.2.3-test.1", "1.2.3-1.test",
               "1.2.3-test.123456", "1.2.3-123456.test",
               "1.2.3-1.a.22.bb.333.ccc.4444.dddd.55555.fffff",
               "1.2.3-alpha.1.2.3+build.314")
  out <- parse_version(version)
  subList <- out[1:2]
  expect_s3_class(subList, "svlist")
  expect_equal(length(out[c(T,F)]), 4L)
})

test_that("canDollarExtractSvptr", {
  version <- c("1.2.3-test","1.2.3-321", "1.2.3-test.1", "1.2.3-1.test",
               "1.2.3-test.123456", "1.2.3-123456.test",
               "1.2.3-1.a.22.bb.333.ccc.4444.dddd.55555.fffff",
               "1.2.3-alpha.1.2.3+build.314")
  out <- parse_version(version)
  expect_identical(out[[8]]$build, "build.314")
})

test_that("canCoerceSvptrToCharacter", {
  version <- c("1.2.3-test","1.2.3-321", "1.2.3-test.1", "1.2.3-1.test",
               "1.2.3-test.123456", "1.2.3-123456.test",
               "1.2.3-1.a.22.bb.333.ccc.4444.dddd.55555.fffff",
               "1.2.3-alpha.1.2.3+build.314")
  out <- parse_version(version)
  expect_identical(as.character(out[[1]]), "1.2.3-test")
})

test_that("canCoerceSvlistToCharacter", {
  version <- c("1.2.3-test","1.2.3-321", "1.2.3-test.1", "1.2.3-1.test",
               "1.2.3-test.123456", "1.2.3-123456.test",
               "1.2.3-1.a.22.bb.333.ccc.4444.dddd.55555.fffff",
               "1.2.3-alpha.1.2.3+build.314")
  out <- parse_version(version)
  expect_identical(as.character(out), version)
})

test_that("canCoerceSvlistToData.frame", {
  version <- c("1.2.3-test","1.2.3-321", "1.2.3-test.1", "1.2.3-1.test",
               "1.2.3-test.123456", "1.2.3-123456.test",
               "1.2.3-1.a.22.bb.333.ccc.4444.dddd.55555.fffff",
               "1.2.3-alpha.1.2.3+build.314")
  out <- parse_version(version)
  res <- as.data.frame(out)
  expect_is(res, "data.frame")
  expect_identical(names(res),
                   c("major", "minor", "patch", "prerelease", "build"))
})

test_that("canCompareSvptr", {
  version <- c("1.7.1", "1.2.3-alpha", "1.2.3-alpha+1", "1.2.3-beta",
               "1.2.3")
  out <- parse_version(version)
  expect_true(out[[1]] > out[[2]])
  expect_false(out[[1]] < out[[2]])
  expect_true(out[[1]] >= out[[2]])
  expect_false(out[[1]] <= out[[2]])
  expect_true(out[[1]] != out[[2]])
  expect_true(out[[3]] == out[[2]])
})

test_that("canCompareSvlist", {
  version <- c("1.7.1", "1.2.3-alpha", "1.2.3-alpha+1", "1.2.3-beta",
               "1.2.3")
  out <- parse_version(version)
  expect_identical(out[1] > out, c(FALSE, TRUE, TRUE, TRUE, TRUE))
})

test_that("canCompareToCharacter", {
  version <- c("1.7.1", "1.2.3-alpha", "1.2.3-alpha+1", "1.2.3-beta",
               "1.2.3", "1.2.3-alpha.1", "1.2.3-alpha.2", "1.2.3-alpha.a")
  out <- parse_version(version)
  expect_identical(out > "1.5.1", c(TRUE, rep(FALSE, 7)))
  expect_true("1.5.1" < out[[1]])
  expect_true(out[[6]] < out[[7]])
  expect_false(out[[7]] <= out[[6]])
  expect_true(out[[2]] < out[[7]])
  expect_true(out[[7]] < out[[8]])
})

test_that("canGetStats", {
  version <- c("1.7.1", "1.2.3-alpha", "1.2.3-alpha+1", "1.2.3-beta",
               "1.2.3")
  out <- parse_version(version)
  expect_identical(as.character(sort(out)), version[c(2L, 3L, 4L, 5L, 1L)])
  expect_identical(order(out), c(2L, 3L, 4L, 5L, 1L))
  expect_identical(as.character(max(out)), "1.7.1")
  expect_identical(as.character(min(out)), "1.2.3-alpha")
  expect_identical(rank(out), c(5, 1.5, 1.5, 3, 4))
  expect_identical(as.character(range(out)), c("1.2.3-alpha", "1.7.1"))
})

test_that("classErrorSvptr", {
  version <- c("1.7.1", "1.2.3-alpha", "1.2.3-alpha+1", "1.2.3-beta",
               "1.2.3")
  out <- parse_version(version)
  expect_error(!out[[1]], "unary ! not defined for \"svptr\" objects")
  expect_error(out[[1]] & out[[2]], "& not defined for \"svptr\" objects")

})

test_that("classErrorSvlist", {
  version <- c("1.7.1", "1.2.3-alpha", "1.2.3-alpha+1", "1.2.3-beta",
               "1.2.3")
  out <- parse_version(version)
  expect_error(!out, "unary ! not defined for \"svlist\" objects")
  expect_error(out & out[2], "& not defined for \"svlist\" objects")
  expect_error(all(out), "all not defined for \"svlist\" objects")
})
