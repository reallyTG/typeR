library(testthat)


### Name: test_that
### Title: Create a test.
### Aliases: test_that

### ** Examples

test_that("trigonometric functions match identities", {
  expect_equal(sin(pi / 4), 1 / sqrt(2))
  expect_equal(cos(pi / 4), 1 / sqrt(2))
  expect_equal(tan(pi / 4), 1)
})
# Failing test:
## Not run: 
##D test_that("trigonometric functions match identities", {
##D   expect_equal(sin(pi / 4), 1)
##D })
## End(Not run)



