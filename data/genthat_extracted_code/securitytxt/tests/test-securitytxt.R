context("core functionality")
test_that("extraction and validation work", {

  x <- sectxt(readLines(system.file("extdata", "security.txt", package="securitytxt")))

  expect_that(x, is_a("sectxt"))
  expect_that(sectxt_info(x), is_a("data.frame"))
  expect_equal(sectxt_info(x)$key, c("contact", "encryption"))
  expect_true(sectxt_validate(x))
  expect_equal(sectxt_url("https://securitytxt.org/this/that/the/other.html"),
               "https://securitytxt.org/.well-known/security.txt")

})
