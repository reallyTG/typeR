context("report")

test_that("report", {
  expect_identical(integer_parameters(), c("tmax", "tR", "BH"))
  report <- ypr_report(ypr_population(), file = tempfile())
  expect_is(report, "character")
  expect_identical(report[1], "---")
  expect_identical(report[2], "title: \"Population Report\"")
})
