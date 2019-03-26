library(pkgdown)


### Name: test-dont
### Title: Test case: don't
### Aliases: test-dont
### Keywords: internal

### ** Examples

## Not run: 
##D 1 + 3
## End(Not run)

## No test: 
1 + 3
## End(No test)

answer <- 1
## Don't show: 
answer <- 42
## End(Don't show)
answer # should be 42



