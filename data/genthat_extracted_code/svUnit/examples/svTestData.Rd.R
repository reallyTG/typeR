library(svUnit)


### Name: svTestData
### Title: Objects of class 'svTestData' contain results from running a
###   test
### Aliases: is.svTestData stats stats.svTestData print.svTestData
###   summary.svTestData
### Keywords: utilities

### ** Examples

foo <- function(x, y = 2) return(x * y)
is.test(foo)  # No
## Create test cases for this function
test(foo) <- function () {
	checkEqualsNumeric(4, foo(2))
	checkEqualsNumeric(5, foo(2, 3))
	checkEqualsNumeric(5, foo(nonexists))
}
## Generate a 'svTestData' object by running the test
obj <- runTest(foo)  # Equivalent to runTest(test(foo)), but shorter
obj
summary(obj)
stats(obj)
is.svTestData(obj)

rm(foo, obj)



