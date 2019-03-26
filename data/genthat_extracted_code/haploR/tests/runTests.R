# Adapted from: http://rwiki.sciviews.org/doku.php?id=developers:runit

if( identical( .Platform$OS.type, "windows" ) && 
    identical( .Platform$r_arch, "x64" ) ){
  print( "unit tests not run on windows 64 (workaround alert)" )
} else {
  if(require("RUnit", quietly = TRUE)) {
    pkg <- "haploR"
    if(Sys.getenv("RCMDCHECK") == "FALSE") {
      path <- file.path(getwd(), "..", "inst", "unitTests")
    } else {
      path <- system.file(package=pkg, "unitTests")
    }

    cat("\nRunning unit tests:\n")
    print(list(pkg=pkg, getwd=getwd(), pathToUnitTests=path))
    
    library(package=pkg, character.only=TRUE)
    
    # Define tests
    testSuite <- defineTestSuite(name=paste(pkg, "unit testing"), 
                                 dirs=path, 
                                 testFuncRegexp = "^test_+", 
                                 testFileRegexp = "^test_+")
    
    # Run
    tests <- runTestSuite(testSuite)
    
    # Default report name
    pathReport <- file.path(path, "report")
    
    # Report to stdout
    printTextProtocol(tests, showDetails=FALSE)
    
    # Return stop() to cause R CMD check stop in case of
    #  - failures i.e. FALSE to unit tests or
    #  - errors i.e. R errors
    tmp <- getErrors(tests)
    if(tmp$nFail > 0 | tmp$nErr > 0) {
      stop(paste("\n\nUnit testing failed (#test failures: ", tmp$nFail, ", 
                 #R errors: ",  tmp$nErr, ")\n\n", sep=""))
    }
    
  } else {
    print( "package RUnit not available, cannot run unit tests" )
  }       
}
