library(testthat)


### Name: expect_match
### Title: Expectation: does string match a regular expression?
### Aliases: expect_match

### ** Examples

expect_match("Testing is fun", "fun")
expect_match("Testing is fun", "f.n")

## Not run: 
##D expect_match("Testing is fun", "horrible")
##D 
##D # Zero-length inputs always fail
##D expect_match(character(), ".")
## End(Not run)



