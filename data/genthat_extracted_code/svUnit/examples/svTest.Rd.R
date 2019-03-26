library(svUnit)


### Name: svTest
### Title: Create, attach to and manipulate test functions in R objects
### Aliases: svTest as.svTest is.svTest test test<- is.test print.svTest
###   makeUnit makeTestListFromExamples makeUnit.default makeUnit.svTest
###   runTest runTest.default runTest.svTest runTest.list
### Keywords: utilities

### ** Examples

clearLog()	# Clear the log file

foo <- function(x, y = 2) return(x * y)
is.test(foo)	# No
## Create test cases for this function
test(foo) <- function () {
	checkEqualsNumeric(4, foo(2))
	checkEqualsNumeric(6, foo(2, 3))
	checkTrue(is.test(foo))
	checkTrue(is.test(test(foo)))
	checkIdentical(attr(foo, "test"), test(foo))
	checkException(foo(2, "aa"))
	checkException(foo("bb"))
}
is.test(foo)	# Yes

## Not run: 
##D ## Create a test unit on disk and view it
##D unit <- makeUnit(foo)
##D file.show(unit, delete.file = TRUE)
## End(Not run)

## Run the test
(runTest(foo))
## Same as...
bar <- test(foo)
(runTest(bar))

## How fast can we run 100 times such kind of tests (700 test in total)?
## (just an indication because in real situation with test unit files, we
## have also the time required to source the units!)
system.time(for (i in 1:100) runTest(foo))[3]

is.svTest(test(foo))	# Yes, of course!
## When an object without associated test is passed to runTest(), a simple
## test containing only a DEACTIVATED entry is build
x <- 1:10
summary(runTest(x))

summary(Log())

rm(foo, bar, x)



