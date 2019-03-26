library(testthat)


### Name: skip
### Title: Skip a test.
### Aliases: skip skip_if_not skip_if skip_if_not_installed skip_on_cran
###   skip_on_os skip_on_travis skip_on_appveyor skip_on_bioc
###   skip_if_translated

### ** Examples

if (FALSE) skip("No internet connection")

## The following are only meaningful when put in test files and
## run with `test_file`, `test_dir`, `test_check`, etc.

test_that("skip example", {
  expect_equal(1, 1L)    # this expectation runs
  skip('skip')
  expect_equal(1, 2)     # this one skipped
  expect_equal(1, 3)     # this one is also skipped
})



