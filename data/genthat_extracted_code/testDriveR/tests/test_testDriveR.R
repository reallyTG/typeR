context("Data check")

test_that("data objects are unchanged", {
  expect_equal_to_reference(auto17, "auto17.Rdata")
  expect_equal_to_reference(childMortality, "childMortality.RData")
  expect_equal_to_reference(gss14, "gss14.rda")
  expect_equal_to_reference(gss14_simple, "gss14_simple.rda")
  expect_equal_to_reference(kerrich, "kerrich.rda")
})
