library(mockery)


### Name: call-expectations
### Title: Expectation: does the given call match the expected?
### Aliases: call-expectations expect_call expect_args expect_called

### ** Examples

library(testthat)

# expect call expression (signature)
m <- mock()
with_mock(summary = m, summary(iris))

# it has been called once
expect_called(m, 1)

# the first (and only) call's arguments matches summary(iris)
expect_call(m, 1, summary(iris))

# expect argument value
m <- mock()
a <- iris
with_mock(summary = m, summary(object = a))
expect_args(m, 1, object = a)
# is an equivalent to ...
expect_equal(mock_args(m)[[1]], list(object = a))




