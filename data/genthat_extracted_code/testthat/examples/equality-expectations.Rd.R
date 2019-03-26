library(testthat)


### Name: equality-expectations
### Title: Expectation: is the object equal to a value?
### Aliases: equality-expectations expect_equal expect_setequal
###   expect_equivalent expect_identical expect_identical expect_reference

### ** Examples

a <- 10
expect_equal(a, 10)

# Use expect_equal() when testing for numeric equality
sqrt(2) ^ 2 - 1
expect_equal(sqrt(2) ^ 2, 2)
# Neither of these forms take floating point representation errors into
# account
## Not run: 
##D expect_true(sqrt(2) ^ 2 == 2)
##D expect_identical(sqrt(2) ^ 2, 2)
## End(Not run)

# You can pass on additional arguments to all.equal:
## Not run: 
##D # Test the ABSOLUTE difference is within .002
##D expect_equal(10.01, 10, tolerance = .002, scale = 1)
## End(Not run)

# Test the RELATIVE difference is within .002
x <- 10
expect_equal(10.01, expected = x, tolerance = 0.002, scale = x)

# expect_equivalent ignores attributes
a <- b <- 1:3
names(b) <- letters[1:3]
expect_equivalent(a, b)



