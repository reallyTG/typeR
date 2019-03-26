context("test-render_version")

test_that("canRenderSvlist", {
  version <- c("1.2.3-test","1.2.3-321", "1.2.3-test.1", "1.2.3-1.test",
               "1.2.3-test.123456", "1.2.3-123456.test",
               "1.2.3-1.a.22.bb.333.ccc.4444.dddd.55555.fffff",
               "1.2.3-alpha.1.2.3+build.314")
  out <- parse_version(version)
  res <- render_version(out)
  expect_is(res, "list")
  expect_identical(length(res), 8L)
})

test_that("canRenderSvptr", {
  version <- c("1.2.3-test","1.2.3-321", "1.2.3-test.1", "1.2.3-1.test",
               "1.2.3-test.123456", "1.2.3-123456.test",
               "1.2.3-1.a.22.bb.333.ccc.4444.dddd.55555.fffff",
               "1.2.3-alpha.1.2.3+build.314")
  out <- parse_version(version)
  res <- render_version(out[[8]])
  expect_is(res, "list")
  expect_identical(names(res),
                   c("major", "minor", "patch", "prerelease", "build"))
  expect_identical(res[["build"]], "build.314")
  expect_identical(res[["major"]], 1L)
})
