library(svUnit)


### Name: svSuite
### Title: Create and run test suites by collecting together unit tests and
###   function tests defined in objects
### Aliases: svSuite as.svSuite is.svSuite svSuiteList print.svSuite
###   makeUnit.svSuite runTest.svSuite
### Keywords: utilities

### ** Examples

svSuiteList()	# List all currently available test units and test cases
## Exclusion list is used (regular expression filtering!). It contains:
(oex <- getOption("svUnit.excludeList"))
## Clear it, and relist available test units
options(svUnit.excludeList = NULL)
svSuiteList()

## Two functions that include their test cases
Square <- function(x) return(x^2)
test(Square) <- function() {
	checkEquals(9, Square(3))
	checkEquals(c(1, 4, 9), Square(1:3))
	checkException(Square("xx"))
}

Cube <- function(x) return(x^3)
test(Cube) <- function() {
	checkEquals(27, Cube(3))
	checkEquals(c(1, 8, 28), Cube(1:3))
	checkException(Cube("xx"))
}

## A separate test case object (not attached to a particular object)
## This is the simplest way to loosely define quick and durty integration tests
test_Integrate <- svTest(function() {
	checkTrue(1 < 2, "check1")
	v <- 1:3 	# The reference
	w <- 1:3 	# The value to compare to the reference
	checkEquals(v, w)
})

## A function without test cases (will be filtered out of the suite list)
foo <- function(x) return(x)

## Look now which tests are available
svSuiteList()

## Only objects, no package units
svSuiteList(packages = FALSE)

## Not run: 
##D ## Create the test unit file for all objects with tests in .GlobalEnv
##D myunit <- makeUnit(svSuiteList(), name = "AllTests")
##D file.show(myunit, delete.file = TRUE)
## End(Not run)

## Filter objects using a list (object with/without tests and a nonexisting obj)
svSuiteList(packages = FALSE, objects = c("Cube", "foo", "bar"))

## Create another svSuite object with selected test items
(mysuite <- svSuite(c("package:svUnit (VirtualClass)", "test(Cube)")))
is.svSuite(mysuite)	# Should be!

## Not run: 
##D ## Run all the tests currently available
##D (runTest(svSuiteList(), name = "AllTests"))
##D summary(Log())
## End(Not run)

## Restore previous exclusion list, and clean up the environment
options(svUnit.excludeList = oex)
rm(Square, Cube, foo, test_Integrate, mysuite, myunit, oex)



