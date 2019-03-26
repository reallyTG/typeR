library(testthat)


### Name: comparison-expectations
### Title: Expectation: is returned value less or greater than specified
###   value?
### Aliases: comparison-expectations expect_lt expect_lte expect_gt
###   expect_gte expect_less_than expect_more_than

### ** Examples

a <- 9
expect_lt(a, 10)

## Not run: 
##D expect_lt(11, 10)
## End(Not run)

a <- 11
expect_gt(a, 10)
## Not run: 
##D expect_gt(9, 10)
## End(Not run)



