library(svUnit)


### Name: svSuiteData
### Title: Objects of class 'svSuiteData' contain results from running test
###   suites
### Aliases: svSuiteData is.svSuiteData stats.svSuiteData metadata
###   metadata.svSuiteData print.svSuiteData summary.svSuiteData protocol
###   protocol.default protocol.svSuiteData protocol_text
###   protocol_text.svSuiteData protocol_junit protocol_junit.svSuiteData
###   protocol_junit.svTestData
### Keywords: utilities

### ** Examples

clearLog()	# Clear any existing log

## Run some tests
checkTrue(1 < 2)
checkException(log("a"))
foo <- function(x, y = 2) return(x * y)
test(foo) <- function () {
    checkEqualsNumeric(4, foo(2))
    checkEqualsNumeric(6, foo(2, nonexisting))
    checkTrue(is.test(foo))
    warning("This is a warning")
    cat("Youhou from test!\n")  # Don't use, except for debugging!
    checkTrue(is.test(test(foo)))
    checkIdentical(attr(foo, "test"), test(foo))
    checkException(foo(2, nonexisting))
    #DEACTIVATED("My deactivation message")
    checkException(foo(2))  # This test fails
}
runTest(foo)

## Now inspect the log, which is a 'svSuiteData' object
is.svSuiteData(Log())
stats(Log())
metadata(Log())
Log()	# Print method
summary(Log())

## Not run: 
##D ## To get a print of the test protocol on file, use:
##D protocol(Log(), type = "text", file = "RprofProtocol.out")
##D file.show("RprofProtocol.out")
##D unlink("RprofProtocol.out")
## End(Not run)

rm(foo)

## Not run: 
##D ## Profiling of very simple test runs
##D library(utils)
##D createLog(description = "test profiling", deleteExisting = TRUE)
##D imax <- 3
##D jmax <- 100
##D l <- 50
##D Rprof()
##D for (i in 1:imax) {
##D 	# Change the context for these tests
##D     .Log$..Test <- paste("Test", i, sep = "")
##D     .Log$..Tag <- paste("#", i, sep = "")
##D     res <- system.time({
##D         for (j in 1:jmax) checkTrue(i <= j, "My test")
##D     }, gcFirst = TRUE)[3]
##D     print(res)
##D     flush.console()
##D }
##D Rprof(NULL)
##D ## Look at profile
##D summaryRprof()
##D unlink("Rprof.out")
##D 
##D ## Look at the log
##D summary(Log())
## End(Not run)



