library(svUnit)


### Name: unitTests.svUnit
### Title: Unit tests for the package svUnit
### Aliases: unitTests.svUnit
### Keywords: utilities

### ** Examples

if (require(svUnit)) {
    clearLog()
    runTest(svSuite("package:svUnit"), "svUnit")
  ## No test: 
    ## Tests to run with example() but not with R CMD check
    runTest(svSuite("package:svUnit (VirtualClass)"), "VirtualClass")
  
## End(No test)
  ## Not run: 
##D 	## Tests to present in ?unitTests.svUnit but not run automatically
##D 	## Run all currently loaded packages test cases and test suites
##D 	runTest(svSuiteList(), "AllTests")
##D   
## End(Not run)
  ## Don't show: 
    ## Put here test units you want to run during R CMD check but
	## don't want to show or run with example(unitTests.svUnit)
  
## End(Don't show)
    ## Check errors at the end (needed to interrupt R CMD check)
    errorLog()
}



