
context("as.Dates.data.frame")


test_that("misc", {
  expect_that(as.Dates.data.frame(data.frame(), progress_bar = FALSE), throws_error())
})

