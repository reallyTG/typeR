library(svUnit)


### Name: svUnit-package
### Title: A framework for test cases, test units and test suites in R
### Aliases: svUnit-package svUnit
### Keywords: package utilities

### ** Examples

## Clear the logger
clearLog()

## Design and attach a simple test function to an object
foo <- function(x, y = 2) return(x * y)
testfoo <- function () {
    #DEACTIVATED()	# Use this to deactive the test (notice placed in the log)
    checkEqualsNumeric(5, foo(2),	"Check return of foo()")
	checkException(foo("b"),		"Wrong first argument")
    checkException(foo(2, "a"),		"Wrong second argument")

}
## Attach this to the foo function
test(foo) <- testfoo

## Run this test
runTest(foo)

## Inspect the result
ls(.Log)
.Log$`test(foo)`
## This test fails. You see that the test function requires that foo(2) = 5 and
## the actual implementation returns 4. This is a trivial, useless example, but
## you are supposed to correct the function. For instance:
foo <- function(x, y = 2) return(x * y + 1)
test(foo) <- testfoo

(runTest(foo))	# Now, that's fine!



