
context("Cases")

test_that("Attributes are preserved", {
  cases <- vdiffr:::cases(list(), "pkg_path", "deps")
  new_cases <- filter_cases(cases, "new")

  expect_equal(attr(new_cases, "pkg_path"), "pkg_path")
  expect_equal(attr(new_cases, "deps"), "deps")
})
