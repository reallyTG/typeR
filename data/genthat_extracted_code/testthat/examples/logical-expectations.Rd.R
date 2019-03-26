library(testthat)


### Name: logical-expectations
### Title: Expectation: is the object true/false?
### Aliases: logical-expectations expect_true expect_false

### ** Examples

expect_true(2 == 2)
# Failed expectations will throw an error
## Not run: 
##D expect_true(2 != 2)
## End(Not run)
expect_true(!(2 != 2))
# or better:
expect_false(2 != 2)

a <- 1:3
expect_true(length(a) == 3)
# but better to use more specific expectation, if available
expect_equal(length(a), 3)



