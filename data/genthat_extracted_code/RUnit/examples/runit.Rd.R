library(RUnit)


### Name: runTestSuite
### Title: Definition and execution of RUnit test suites.
### Aliases: runTestSuite runTestFile defineTestSuite isValidTestSuite
### Keywords: programming

### ** Examples


## run some test suite
myTestSuite <- defineTestSuite("RUnit Example",
                               system.file("examples", package = "RUnit"),
                               testFileRegexp = "correctTestCase.r")
testResult <- runTestSuite(myTestSuite)

##  same but without the logger being involved
## source(file.path(system.file("examples", package = "RUnit"), 
##                  "correctTestCase.r"))
## test.correctTestCase()


## prints detailed text protocol
## to standard out:
printTextProtocol(testResult, showDetails = TRUE)

##  use current default RNGs
myTestSuite1 <- defineTestSuite("RUnit Example",
                               system.file("examples", package = "RUnit"),
                               testFileRegexp = "correctTestCase.r",
                               rngKind = "Mersenne-Twister",
                               rngNormalKind = "Inversion")

testResult1 <- runTestSuite(myTestSuite)


##  for single test files, e.g. outside a package context
testResult2 <- runTestFile(file.path(system.file("examples", 
                                                 package = "RUnit"),
                                     "correctTestCase.r"))
printTextProtocol(testResult2, showDetails = TRUE)



