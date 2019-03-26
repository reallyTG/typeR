library(testthat)


### Name: with_mock
### Title: Mock functions in a package.
### Aliases: with_mock
### Keywords: internal

### ** Examples

add_one <- function(x) x + 1
expect_equal(add_one(2), 3)
with_mock(
  add_one = function(x) x - 1,
  expect_equal(add_one(2), 1)
)
square_add_one <- function(x) add_one(x) ^ 2
expect_equal(square_add_one(2), 9)
expect_equal(
  with_mock(
    add_one = function(x) x - 1,
    square_add_one(2)
  ),
  1
)



