library(svUnit)


### Name: Log
### Title: SciViews R log management functions
### Aliases: Log createLog clearLog errorLog lastTest lastSuite
### Keywords: utilities

### ** Examples

clearLog()			# Clear the svUnit log

## Two correct tests
(checkTrue(1 < 2))
(checkException(log("a")))
errorLog()			# Nothing, because there is no error

## Not run: 
##D (checkTrue(1 > 2))	# This test fails
##D lastTest()			# Print results of last test
##D errorLog()			# Stop and summarize the tests run so far
## End(Not run)

clearLog()



