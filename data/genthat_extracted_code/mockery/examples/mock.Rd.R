library(mockery)


### Name: mock
### Title: Create and query a mocked function.
### Aliases: mock mock mock_args mock_calls length.mock

### ** Examples

library(testthat)

m <- mock(1)
with_mock(summary = m, {
  expect_equal(summary(iris), 1)
  expect_called(m, 1)
  expect_call(m, 1, summary(iris))
  expect_args(m, 1, iris)
})

# multiple return values
m <- mock(1, "a", sqrt(3))
with_mock(summary = m, {
  expect_equal(summary(iris), 1)
  expect_equal(summary(iris), "a")
  expect_equal(summary(iris), 1.73, tolerance = .01)
})

# side effects
m <- mock(1, 2, stop("error"))
with_mock(summary = m, {
  expect_equal(summary(iris), 1)
  expect_equal(summary(iris), 2)
  expect_error(summary(iris), "error")
})

# accessing call expressions
m <- mock()
m(x = 1)
m(y = 2)
expect_equal(length(m), 2)
calls <- mock_calls(m)
expect_equal(calls[[1]], quote(m(x = 1)))
expect_equal(calls[[2]], quote(m(y = 2)))

# accessing values of arguments
m <- mock()
m(x = 1)
m(y = 2)
expect_equal(length(m), 2)
args <- mock_args(m)
expect_equal(args[[1]], list(x = 1))
expect_equal(args[[2]], list(y = 2))





