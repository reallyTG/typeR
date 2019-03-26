library(pkgdown)


### Name: test-output-styles
### Title: Test case: output styles
### Aliases: test-output-styles
### Keywords: internal

### ** Examples

# This example illustrates some important output types
# The following output should be wrapped over multiple lines
a <- 1:100
a

cat("This some text!\n")
message("This is a message!")
warning("This is a warning!")

# This is a multi-line block
{
  1 + 2
  2 + 2
}

## Not run: 
##D stop("This is an error!", call. = FALSE)
## End(Not run)

## No test: 
# This code won't generally be run by CRAN. But it
# will be run by pkgdown
b <- 10
a + b
## End(No test)



