library(RUnit)


### Name: textProtocol
### Title: Printing a plain text, HTML or JUnit-like XML version of an
###   RUnit test run protocol.
### Aliases: printTextProtocol printHTMLProtocol printJUnitProtocol
###   print.RUnitTestData summary.RUnitTestData getErrors
### Keywords: programming

### ** Examples


## run some test suite
myTestSuite <- defineTestSuite("RUnit Example",
                               system.file("examples", package = "RUnit"),
                               testFileRegexp = "correctTestCase.r")
testResult <- runTestSuite(myTestSuite)


## prints detailed text protocol
## to standard out:
printTextProtocol(testResult, showDetails = TRUE)
## prints detailed html protocol
## to standard out
printHTMLProtocol(testResult)
## prints JUnit-style XML protocol
## to standard out. 
## You need to have XML package installed for this
if(require("XML")) {
  printJUnitProtocol(testResult)
}

## Not run: 
##D ##  example function to add links to URL of the code files in a code
##D ##  repository, here the SourceForge repository
##D testFileToSFLinkMap <- function(testFileName, testDir = "tests") {
##D     ##  get unit test file name
##D     bname <- basename(testFileName)
##D     
##D     ## figure out package name
##D     regExp <- paste("^.*/([\.a-zA-Z0-9]*)/", testDir,"/.*$", sep = "")
##D     pack <- sub(regExp, "\1", testFileName)
##D     return(paste("http://runit.cvs.sourceforge.net/runit/",
##D                  pack, testDir, bname, sep = "/"))
##D   }
##D 
##D 
##D ##  example call for a test suite run on the RUnit package
##D testSuite <- defineTestSuite("RUnit", "<path-to-source-folder>/RUnit/tests",
##D                              testFileRegexp = "^test.+")
##D testResult <- runTestSuite(testSuite)
##D printHTMLProtocol(testResult, fileName = "RUnit-unit-test-log.html",
##D                   testFileToLinkMap = testFileToSFLinkMap )
## End(Not run)




