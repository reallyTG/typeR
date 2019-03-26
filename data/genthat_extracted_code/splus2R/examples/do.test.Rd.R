library(splus2R)


### Name: do.test
### Title: Test Functions and Expressions - for automated testing
### Aliases: do.test
### Keywords: utilities

### ** Examples

## Not run: 
##D # Create a toy test file, and run it
##D cat('{all.equal(24/8, 3)}',
##D     '{all.equal(5, 6)}',      # this one will fail
##D     'expectWarnings( { # Test subscript replacement ',
##D     '  x <- data.frame(a=1:3,b=2:4)',
##D     '  x[,3] <- x',
##D     '  all.equal(ncol(x), 3)',
##D     '}, expected = "provided 2 variables to replace 1 var")',
##D     'expectStop(lm(5), expected = "invalid formula")',
##D     '{ rm(x) ; TRUE }',       # cleanup at end of test
##D     sep="\n", file = "testfile.t")
##D do.test("testfile.t")
##D ## ------- Test file: testfile.t ---------
##D ## {all.equal(5, 6)}
##D ## [1] "Mean relative difference: 0.2"
##D #
##D # The test that fails is printed, with the results of the test.
##D # In R 2.6.1 the subscript replacement test above also fails
##D # (bug reported 14 Jan 2008), resulting in the additional printout:
##D ## expectWarnings( {
##D ##   x <- data.frame(a=1:3,b=2:4)
##D ##   x[,3] <- x
##D ##   all.equal(ncol(x), 3)
##D ## }, expected = "provided 2 variables to replace 1 var")
##D ## $`Test result`
##D ## [1] "Mean relative  difference: 0.25"
## End(Not run)

# This function is useful in some tests:
all.equal.excluding <- function(x, y, ..., excluding=NULL, attrs=NULL){
  # Like all.equal, but exclude components in `excluding',
  #   and excluding attributes named in `attrs'.
  #
  # `excluding' and `attrs' should be character, names of components 
  #   and attributes.
  # 
  # For example:
  #   all.equal.excluding(obj1, obj2, excluding = c("call", "x"))
  for(i in intersect(names(x), excluding)) x[[i]] <- NULL
  for(i in intersect(names(y), excluding)) y[[i]] <- NULL
  for(i in intersect(names(attributes(x)), attrs)) attr(x,i) <- NULL
  for(i in intersect(names(attributes(y)), attrs)) attr(y,i) <- NULL
  all.equal(x,y, ...)
}
# Test if two objects are the same except for "call" and "x":
data <- data.frame(x = 1:20, y = exp(1:20/20))
fit1 <- lm(y ~ x, data = data, x=TRUE)
fit2 <- update(fit1, x=)
all.equal.excluding(fit1, fit2, excluding = c("call", "x"))



