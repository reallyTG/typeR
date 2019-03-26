library(testextra)


### Name: class-expectations
### Title: Class Expectations
### Aliases: class-expectations expect_is_not expect_is_exactly
###   expect_all_inherit

### ** Examples


# Test to make sure an object is not of a class.
## Not run: 
##D # will return an error.
##D expect_is_not(1L, "numeric")
## End(Not run)

# but this is fine.
expect_is_not('a', "numeric")

expect_is_exactly('a', "character")



