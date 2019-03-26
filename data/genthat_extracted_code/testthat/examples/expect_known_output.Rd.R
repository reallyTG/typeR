library(testthat)


### Name: expect_known_output
### Title: Expectations: is the output or the value equal to a known good
###   value?
### Aliases: expect_known_output expect_output_file expect_known_value
###   expect_equal_to_reference expect_known_hash

### ** Examples

tmp <- tempfile()

# The first run always succeeds
expect_known_output(mtcars[1:10, ], tmp, print = TRUE)

# Subsequent runs will suceed only if the file is unchanged
# This will succeed:
expect_known_output(mtcars[1:10, ], tmp, print = TRUE)

## Not run: 
##D # This will fail
##D expect_known_output(mtcars[1:9, ], tmp, print = TRUE)
## End(Not run)



